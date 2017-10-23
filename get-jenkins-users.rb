#!/usr/bin/env ruby
# vi: set ft=ruby expandtab ts=2 sw=2 sts=2:

require 'hiera'
require 'json'
require 'logger'
require 'net/http'
require 'nokogiri'
require 'optparse'
require 'pastel'
require 'thread'
require 'tty-table'
require 'uri'
require 'yaml'

$log = Logger.new(STDERR)
$log.level = Logger::ERROR
$log.datetime_format = "%Y-%m-%d %H:%M:%S "
# valid hiera loggers: console, noop, fallback, puppet
$hiera_logger = 'noop'

BASE_PATH = File.expand_path(File.join(File.dirname(__FILE__)))

def get_deployer_instances
  deployers = []
  hiera_config = YAML.load_file(File.expand_path(File.join(BASE_PATH, '..', "verify-puppet/spec/fixtures/hiera.yaml")))
  hiera_config[:logger] = $hiera_logger
  hiera = Hiera.new(:config => hiera_config)
  hiera_glob = File.expand_path(File.join(BASE_PATH, '..', "verify-puppet/hiera/vdc/*.yaml"))
  Dir.glob(hiera_glob) do |vdc|
    dns_hosts = hiera.lookup("gds_dns::server::hosts", "vdc/%{vdc}", {'::vdc' => vdc.gsub(/.*\//, '').gsub(/\.yaml/, '')})
    if dns_hosts
      dns_hosts.split("\n").each do |host|
        if host.match('deployer') and not host.match('vagrant') and not host.match('%{hiera')
          deployers.push(host.split(' ')[1])
          $log.debug("Found #{deployers[-1]}")
        elsif host.match('deployer') and ( host.match('vagrant') or host.match('%{hiera') )
          $log.debug("Ignored #{host}")
        end
      end
    end
  end
  $log.info("Retrieved deployers list: #{deployers.uniq.inspect}")
  deployers.uniq
end

def get_deployer_uris(deployers)
  data = {}
  deployers.each do |deployer|
    data.update({
      deployer => {
        'uri' => URI.join(
          'https://' + deployer.gsub(/er-1\.mgmt\./, '-').gsub(/\.signin\.service\.gov\.uk/, '').gsub(/er-1\.node\./, '-').gsub(/\./, '-').gsub(/$/, '.ida.digital.cabinet-office.gov.uk')
        ).to_s
      }
    })
  end
  if $options[:instances].length > 0
    $options[:instances].each do |deployer|
      data.update({
        deployer.gsub(/\..*/, '') => {
          'uri' => 'https://' + deployer
        }
      })
    end
  end
  $log.debug("Mapped deployers: #{data.inspect}")
  data
end

def api_request(uris, path, call_type = 'json')
  $log.debug("Recieved list of URIs: #{uris.inspect}")

  queue = Queue.new

  threads = uris.map do |deployer, data|
    Thread.new do
      $log.info("Making API request to #{data['uri']}/#{path}")
      result = { deployer: deployer, path: path }

      begin
        uri = URI.parse(data['uri'])

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.open_timeout = 5
        http.read_timeout = 600

        request = Net::HTTP::Get.new(path)
        request.basic_auth($options[:username], $options[:password])

        response = http.request(request)

        if response.code.to_i == 200
          if call_type == 'json'
            result[:body] = JSON.parse(response.body)
          elsif call_type == 'xml'
            result[:body] = Nokogiri::XML(response.body)
          else
            result[:body] = response.body
          end
          result[:success] = true
        else
          $log.error("Received HTTP #{response.code} from #{uri.host.to_s}: #{response.body}")
        end
        result[:code] = response.code

      rescue Timeout::Error
        $log.warn("Timeout waiting for #{data['uri']}")
        result[:errors] = ['Timeout::Error']

      rescue SocketError
        $log.warn("SocketError connecting to #{data['uri']}")
        result[:errors] = ['SocketError']
      end

      queue << result
    end
  end

  threads.each { |t| t.join }

  until queue.empty? do
    result = queue.pop
    deployer = result[:deployer]
    path = result[:path]

    if result.key? :errors
      uris[deployer]['errors'] = result[:errors]
    end

    if result.key? :success
      uris[deployer][path] = result[:body]
    end

    if result.key? :code
      uris[deployer]['code'] = result[:code]
    end
  end

  uris
end

def map_asynchPeople_to_users(asynchPeople)
  users = {}
  asynchPeople.each do |deployer, data|
    $log.debug("Mapping users: #{deployer.inspect} => #{data.inspect}")

    if data.has_key?('/asynchPeople/api/json') and data['/asynchPeople/api/json'].has_key?('users')

      data['/asynchPeople/api/json']['users'].each do |user|
        username = URI.decode(user['user']['absoluteUrl'].gsub(/^.*\//, ''))

        if username.length > 0
          users[username] = [] unless users.has_key?(username)
          users[username].push(deployer)
          $log.debug("USER: #{deployer} => #{username} => #{user['user']['fullName']}")
        else
          $log.error("Empty user: #{deployer.inspect} => #{user.inspect}")
        end
      end

    else
      $log.debug("No users for #{deployer}")
    end
  end
  users
end

def get_admins(administrators)
  admins = {}
  administrators.each do |deployer, data|
    admins[deployer] = [] unless admins.has_key?(deployer)
    begin
      if not data['/computer/(master)/config.xml'].nil?
        data['/computer/(master)/config.xml'].xpath('//authorizationStrategy').children.each do |perms|
          admin = perms.content.gsub(/hudson.model.Hudson.Administer:/, '')
          if admin.strip.length > 0 and not admin.index(/^hudson\.model\./)
            admins[deployer].push(URI::decode(admin))
          end
        end
      end
    rescue NoMethodError => error
      $log.error("No XML config found for #{deployer}. #{error.inspect} (#{data['/computer/(master)/config.xml']})")
    end
  end
  admins
end

def intersect_admins_and_people(admins, people)
  pastel = Pastel.new
  users = {}
  people.each do |person|
    person[1].each do |deployer|
      users[person[0]] = {} unless users.has_key?(person[0])
      if admins[deployer].include?(person[0])
        users[person[0]][deployer] = pastel.green.on_black('AU')
      else
        users[person[0]][deployer] = pastel.blue.on_black('U')
      end
    end
  end
  admins.each do |deployer, data|
    data.each do |user|
      if not users.has_key?(user)
        users[user] = { deployer => pastel.red.on_black('A') }
      end
    end
  end
  users
end

if __FILE__ == $0
  $options = {}
  optparse = OptionParser.new do |opts|
    opts.banner = <<EOM
Usage: #{__FILE__} [options]

Output is a table where:
 A  indicates user appears as an admin in the matrix authentication tables.
 U  indicates a user account (people) exists
 AU indicates the user exists and is an admin

Note that it's not possible to query 'build.ida.digital.cabinet-office.gov.uk'
nor 'smoketester.ida.digital.cabinet-office.gov.uk' as the /asynchPeople/
endpoint returns all users that have ever been in a changelog, and the
endpoint to get the config.xml doesn't work as expected.

EOM
    opts.on("-uUSERNAME", "--username=USERNAME", "Jenkins username.") do |v|
      $options[:username] = v
    end
    opts.on("-pPASSWORD", "--password=PASSWORD", "Jenkins password.") do |v|
      $options[:password] = v
    end

    $options[:instances] = []
    opts.on("-iJENKINS_INSTANCES", "--instances=JENKINS_INSTANCE", "Comma separated list of additional jenkins instances to check.  If not set, defaults to #{$options[:instances].inspect}") do |v|
      $options[:instances] = v.split(',')
    end
    $options[:verbose] = 0
    opts.on("-v", "--verbose", "Increase verbosity (default is ERROR level only). Use up to 3 times for WARN, INFO and DEBUG level output. ") do |v|
      $options[:verbose] += 1
    end
    opts.on("-q", "--quiet", "Only display fatal errors.  Overrides verbosity levels.") do |v|
      $options[:quiet] = true
    end
  end

  begin
    optparse.parse!
    mandatory = [:username, :password]                               # Enforce the presence of
    missing = mandatory.select{ |param| $options[param].nil? }        # the -t and -f switches
    unless missing.empty?                                            #
      raise OptionParser::MissingArgument.new(missing.join(', '))    #
    end                                                              #
  rescue OptionParser::InvalidOption, OptionParser::MissingArgument  #
    puts $!.to_s                                                     # Friendly output when parsing fails
    puts optparse                                                    #
    exit                                                             #
  end                                                                #


  if $options[:verbose] >= 3
    $log.level = Logger::DEBUG
    $hiera_logger = 'console'
  elsif $options[:verbose] == 2
    $log.level = Logger::INFO
  elsif $options[:verbose] == 1
    $log.level = Logger::WARN
  end

  if $options[:quiet]
    $log.level = Logger::FATAL
  end

  deployers = get_deployer_uris( get_deployer_instances )

  asynchPeople = api_request(deployers, '/asynchPeople/api/json')
  people = map_asynchPeople_to_users(asynchPeople)

  administrators = api_request(deployers, '/computer/(master)/config.xml', 'xml')
  admins = get_admins(administrators)

  users = intersect_admins_and_people(admins, people)

  table = TTY::Table.new header: ['user'] + deployers.keys.sort.map { |d| d.gsub(/.*\./, '') }

  users.sort.each do |username, data|
    row = [username] + deployers.keys.sort.map { |d| data.include?(d) ? data[d] : '' }
    table << row
  end

  puts table.render(:basic, resize: true)
end

require "graphql/client"
require "graphql/client/http"
require 'pp'

GITHUB_API_TOKEN = ENV['GITHUB_API_TOKEN']
unless GITHUB_API_TOKEN
  raise "You must set a GITHUB_API_TOKEN variable to query github"
end

HTTP = GraphQL::Client::HTTP.new("https://api.github.com/graphql") do
  def headers(context)
    {"Authorization": "token #{GITHUB_API_TOKEN}"}
  end
end

unless File.exist? "github_schema.json"
  puts "Querying and saving github graphql schema data to github_schema.json"
  GraphQL::Client.dump_schema(HTTP, "github_schema.json")
end

SCHEMA = GraphQL::Client.load_schema("github_schema.json")

CLIENT = GraphQL::Client.new(schema: SCHEMA, execute: HTTP)

# Note if we ever have more than 100 team members, this will need pagination!
FIRST_100_TEAM_MEMBERS = CLIENT.parse <<-'GRAPHQL'
query($team: String!) {
  organization(login: "alphagov") {
    team(slug: $team) {
    description
      members(first: 100) {
        edges {
          node {
            id,
            name,
            login
          }
        }
      }
    }
  }
}
GRAPHQL

def team_members(team)
  response = CLIENT.query(FIRST_100_TEAM_MEMBERS, variables: {team: team})
  unless response.errors.empty?
    raise response.errors.inspect
  end
  if response.data.organization.team.members.edges
    response.data.organization.team.members.edges.map {|member|
      {
        id: member.node.id,
        name: member.node.name,
        login: member.node.login
      }
    }
  else
    raise "no members in team #{team}"
  end
end

verify_tech_team = JSON.parse(File.read('users.json'))

pushers = team_members("team-identity-assurance")
branchers = team_members("team-identity-assurance-branchers")
team = (pushers.concat(branchers)).uniq

team.each do |person|
  login = person[:login]
  name = person[:name]
  if verify_tech_team.find {|vtt| vtt['github_username'] && vtt['github_username'].casecmp(login) == 0}
    # nothing to do, valid user!
  elsif name != nil && verify_tech_team.find {|vtt| vtt['names'].any? {|n| n.casecmp(name) == 0} }
    match = verify_tech_team.find {|vtt| vtt['names'].any? {|n| n.casecmp(name) == 0} }
    puts "Can't find github user #{login} but they probably should be added to: #{match.pretty_inspect}"
  else
    puts "Can't find github user #{login} in users.json file"
  end
end

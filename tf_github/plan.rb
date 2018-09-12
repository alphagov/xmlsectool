#!/usr/bin/env ruby

require 'optparse'

ARGV.options do |opts|
  opts.on_tail('-h', '--help') { abort(opts.to_s) }
  opts.parse!
end

CONFIGS = ARGV.empty? ? ['teams', 'users', 'repos'] : ARGV
LOGFILE = "tf_plan_#{Time.now.strftime('%Y%m%d-%H%M')}.log"

def run(cmd)
  status = system(cmd, [:out, :err] => [LOGFILE, 'a'])
  unless status
    abort("ERROR: #{cmd}\nSee logs: #{LOGFILE}")
  end
end

ENV['TF_VAR_github_token'] or abort('Need to set TF_VAR_github_token environment variable')
ENV['TF_VAR_github_organization'] or abort('Need to set TF_VAR_github_organization environment variable')

CONFIGS.each do |cfg|
  statefile = File.join(cfg, "#{cfg}.tfstate")
  planfile = "#{cfg}.tfplan"

  puts("#{cfg}:")
  
  puts(" - Initialising terraform in #{cfg}/")
  run("terraform init -no-color #{cfg}")

  unless File.exist?(statefile)
    puts(" - Importing state to #{statefile}")
    run("./import.rb --#{cfg} --import")
  end

  puts(" - Writing plan to #{planfile} using state #{statefile}")
  run("terraform plan -no-color -state=#{statefile} -out=#{planfile} #{cfg}")
  puts(`terraform plan #{planfile}`.split("\n").select { |l| l.include?('Plan:') })

  File.delete('terraform.tfstate') if File.exist?('terraform.tfstate')
  File.delete('terraform.tfstate.backup') if File.exist?('terraform.tfstate.backup')

  puts(" - DONE\n\n")
end

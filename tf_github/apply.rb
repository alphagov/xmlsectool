#!/usr/bin/env ruby

require 'optparse'

ARGV.options do |opts|
  opts.on('--apply', 'Run terraform apply') { @apply = true }
  opts.on_tail('-h', '--help') { abort(opts.to_s) }
  opts.parse!
end

CONFIGS = ['teams', 'users', 'repos']
LOGFILE = "tf_apply_#{Time.now.strftime('%Y%m%d-%H%M')}.#{@apply ? 'apply' : 'plan'}.log"

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
  
  unless File.exist?(statefile)
    puts(" - Initialising terraform in #{cfg}/")
    run("terraform init #{cfg}")    

    puts(" - Importing state to #{statefile}")
    run("./import.rb --#{cfg} --import")
  end

  puts(" - Writing plan to #{planfile} using state #{statefile}")
  run("terraform plan -state=#{statefile} -out=#{planfile} #{cfg}")

  if @apply
    puts(" - **APPLYING** plan #{planfile} using state #{statefile}")
    run("terraform apply -state-out=#{statefile} #{planfile}")
  end

  puts(" - DONE\n\n")
end

#!/usr/bin/env ruby

require 'optparse'

CONFIGS = ['teams', 'users', 'repos']
LOGFILE = "tf_apply_#{Time.now.strftime('%Y%m%d-%H%M')}.#{@apply ? 'apply' : 'plan'}.log"

def run(cmd)
  system(cmd, out: [LOGFILE, 'a'])
end

ENV['TF_VAR_github_token'] or abort('Need to set TF_VAR_github_token environment variable')
ENV['TF_VAR_github_organization'] or abort('Need to set TF_VAR_github_organization environment variable')

ARGV.options do |opts|
  opts.on('--apply', 'Run terraform apply') { @apply = true }
  opts.on_tail('-h', '--help') { abort(opts.to_s) }
  opts.parse!
end

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
    run("terraform apply -state=#{statefile} #{planfile}")
  end
end

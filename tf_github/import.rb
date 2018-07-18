#!/usr/bin/env ruby

require 'optparse'
require 'hcl/checker'
require 'octokit'

CLIENT = Octokit::Client.new(access_token: ENV.fetch('TF_VAR_github_token'))
CLIENT.auto_paginate = true
GITHUB_ORG = ENV.fetch('TF_VAR_github_organization')

def tf_import(config)
  "terraform import -config=#{config}/"
end

@action = :puts

ARGV.options do |opts|
  opts.on('-r', '--repos', 'Import repositories to tfstate') { @repos = true }
  opts.on('-u', '--users', 'Import users to tfstate') { @users = true }
  opts.on('-t', '--teams', 'Import teams to tfstate') { @teams = true }
  opts.on('--import', 'Actually run terraform import') { @action = :system }
  opts.on_tail('-h', '--help') { abort(opts.to_s) }
  opts.parse!
end

def parse_hcl(fn, field)
  HCL::Checker.parse(File.open(fn).read)['module'].map { |k, v| [k, v[field]] }.first
end

# Import repositories
if @repos
  Dir.glob('repos/repo_*.tf').each do |fn|
    module_name, repo_name = parse_hcl(fn, 'name')
    send(@action, "#{tf_import('repos')} module.#{module_name}.github_repository.repo #{repo_name}")
  end
end

# Import users
if @users
  Dir.glob('users/user_*.tf').each do |fn|
    module_name, username = parse_hcl(fn, 'username')
    send(@action, "#{tf_import('users')} module.#{module_name}.github_membership.org_membership #{GITHUB_ORG}:#{username}")
  end
end

# Import teams
if @teams
  _, teams = parse_hcl('teams/teams.tf', 'teams')
  teams.each_with_index do |team, idx|
    team_id = CLIENT.org_teams(GITHUB_ORG).select { |t| t.name == team }.first.id
    send(@action, "#{tf_import('teams')} module.teams.github_team.team[#{idx}] #{team_id}")
  end
end

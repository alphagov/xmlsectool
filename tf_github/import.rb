#!/usr/bin/env ruby

require 'optparse'
require 'hcl/checker'
require 'octokit'

CLIENT = Octokit::Client.new(access_token: ENV.fetch('TF_VAR_github_token'))
CLIENT.auto_paginate = true
GITHUB_ORG = ENV.fetch('TF_VAR_github_organization')

def tf_import(config)
  "terraform import -no-color -config=#{config}/ -state=#{config}/#{config}.tfstate"
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

def find_team_id(name)
  @org_teams ||= CLIENT.org_teams(GITHUB_ORG)
  @org_teams.select { |t| t.name == name }.first.id
end

# Import repositories
if @repos
  Dir.glob('repos/repo_*.tf').each do |fn|
    module_name, repo_name = parse_hcl(fn, 'name')
    send(@action, "#{tf_import('repos')} module.#{module_name}.github_repository.repo #{repo_name}")
    send(@action, "#{tf_import('repos')} module.#{module_name}.github_branch_protection.repo_protect_master #{repo_name}:master")
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
  send(@action, "#{tf_import('teams')} module.teams.github_team.parent_team #{find_team_id('verify-tech-team')}")
  _, teams = parse_hcl('teams/teams.tf', 'teams')
  teams.each_with_index do |team, idx|
    team_id = find_team_id(team)
    send(@action, "#{tf_import('teams')} module.teams.github_team.team[#{idx}] #{team_id}")
  end
end

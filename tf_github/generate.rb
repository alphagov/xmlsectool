#!/usr/bin/env ruby

require 'erb'
require 'octokit'
require 'optparse'
require 'yaml'

CLIENT = Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN'))
CLIENT.auto_paginate = true
GITHUB_ORG = ENV.fetch('TF_VAR_github_organization')

users_dir = nil
repos_dir = nil
teams_tf = nil
repo_team_map = nil
repo_team_map_file = 'repo_team_map'

ARGV.options do |opts|
  opts.on('-u', '--users=dir', 'users dir for output', String) { |dir| users_dir = dir }
  opts.on('-r', '--repos=dir', 'repos dir for output', String) { |dir| repos_dir = dir }
  opts.on('-t', '--teams=file', 'teams.tf output', String) { |file| teams_tf = file }
  opts.on('-m', '--map=file', 'map of repos to teams', String) { |file| repo_team_map_file = file }
  opts.on_tail('-h', '--help') { abort(opts.to_s) }
  opts.parse!
end

def parse_repo_team_map(repo_team_map_file)
  repo_team_map = {}
  YAML.load_file(repo_team_map_file).each do |team, repos|
    repos.each { |repo| (repo_team_map[repo] ||= []).push(team) }
  end
  puts("Parsed #{repo_team_map_file} successfully.")
  repo_team_map
end

def get_team_users(filter)
  CLIENT.org_teams(GITHUB_ORG).select { |team| team.slug.include?(filter) }.map { |team| CLIENT.team_members(team.id) }.flatten.map(&:login).to_set.sort
end

def sanitise_login(login)
  login.gsub(/[^0-9A-Za-z.\-]/, '').gsub('-', '_').downcase
end

def sanitise_repo(repo)
  repo.gsub('-', '_')
end

def write(file, str)
  File.open(file, 'w') { |f| f.write(str) }
end

user_erb = ERB.new(<<-EOS, nil, '>')
module "user_<%= sanitise_login(login) %>" {
  source = "./verify_user"

  username = "<%= login %>"
  realname = "<%= name %>"
  org_role = "<%= role %>"
  teams = [ "${data.github_team.x.id}" ]
}
EOS

teams_erb = ERB.new(<<-EOS, nil, '>')
module "teams" {
  source = "./verify_teams"

  teams = [
    <% teams.each do |team| %>
    "verify-tech-team-<%= team %>",
    <% end %>
  ]
}
EOS

repo_erb = ERB.new(<<-EOS, nil, '>')
module "repo_<%= sanitise_repo(gh_repo.name) %>" {
  source = "./verify_repo"

  name = "<%= gh_repo.name %>"
  description = "<%= gh_repo.description %>"
  private = "<%= gh_repo.private? %>"
  push_teams = [
    <% teams.each do |team| %>
    "verify-tech-team-<%= team %>",
    <% end %>
  ]
}
EOS

unless users_dir.nil?
  Dir.mkdir(users_dir) unless File.directory?(users_dir)
  teams = YAML.load_file(repo_team_map_file).keys.map { |team| [team, 'member'] }.to_h
  get_team_users('identity').each do |login|
    name = CLIENT.user(login).name
    role = CLIENT.organization_membership(GITHUB_ORG, user: login).role
    write(File.join(users_dir, "user_#{sanitise_login(login)}.tf"), user_erb.result(binding))
    puts("user: #{login}")
  end
end

unless teams_tf.nil?
  repo_team_map ||= parse_repo_team_map(repo_team_map_file)
  teams_tf_file = File.open(teams_tf, 'w')
  teams = repo_team_map.values.flatten.to_set
  teams_tf_file.write("#{teams_erb.result(binding)}\n")
end

unless repos_dir.nil?
  Dir.mkdir(repos_dir) unless File.directory?(repos_dir)
  repo_team_map ||= parse_repo_team_map(repo_team_map_file)
  repo_team_map.each do |repo, teams|
    CLIENT.repository?("#{GITHUB_ORG}/#{repo}") || abort("No such repository: #{GITHUB_ORG}/#{repo}")
    gh_repo = CLIENT.repository("#{GITHUB_ORG}/#{repo}") 
    write(File.join(repos_dir, "repo_#{sanitise_repo(repo)}.tf"), repo_erb.result(binding))
    puts("repo: #{repo}")
  end
end


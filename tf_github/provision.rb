#!/usr/bin/env ruby

require 'erb'
require 'octokit'

if ARGV.size < 1
  abort('Usage: ./provision.rb repo')
end

repo = ARGV[0]

client = Octokit::Client.new(access_token: ENV.fetch('TF_VAR_github_token'))
client.auto_paginate = true

# Until the TF Github provider supports required_approving_review_count
# we need to apply branch protection here.
client.protect_branch("#{repo}", 'master', {
  accept: 'application/vnd.github.luke-cage-preview+json',
  required_status_checks: nil,
  enforce_admins: nil,
  restrictions: nil,
  required_pull_request_reviews: {
    required_approving_review_count: 2,
    dismiss_stale_reviews: true,
    require_code_owner_reviews: false
  }
})

# Remove any unmanaged collaborators
client.collaborators(repo).each { |user| client.remove_collaborator(repo, user) }

# Remove old IDA teams
old_teams = ['team-identity-assurance', 'team-identity-assurance-branchers', 'reliability-engineering', 'reliability-engineering-branchers']
client.org_teams('alphagov').select { |team| old_teams.include?(team.slug) }.map(&:id).each do |id|
  client.remove_team_repo(id, repo)
end

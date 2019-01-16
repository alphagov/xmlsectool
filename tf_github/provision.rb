#!/usr/bin/env ruby

require 'erb'
require 'octokit'

if ARGV.size < 1
  abort('Usage: ./provision.rb repo [review_count]')
end

repo = ARGV[0]
review_count = Integer(ARGV[1] || 2)

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
    required_approving_review_count: review_count,
    dismiss_stale_reviews: true,
    require_code_owner_reviews: false
  }
})

# Remove any unmanaged collaborators
client.collaborators(repo).each { |user| client.remove_collaborator(repo, user) }

# Remove old teams
old_teams = [
  'verify-tech-team-core-hub', 
  'verify-tech-team-dcs', 
  'verify-tech-team-connecting',
  'verify-tech-team-eidas-notification',
  'verify-tech-team-eidas-middleware',
  'verify-tech-team-frontend',
  'verify-tech-team-performance-pa',
  'verify-tech-team-performance-dev',
  'verify-tech-team-tools',
]
client.org_teams('alphagov').select { |team| old_teams.include?(team.slug) }.map(&:id).each do |id|
  client.remove_team_repo(id, repo)
end

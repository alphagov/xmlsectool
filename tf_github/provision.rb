#!/usr/bin/env ruby

require 'erb'
require 'octokit'

if ARGV.size < 1
  abort('Usage: ./provision.rb repo')
end

client = Octokit::Client.new(access_token: ENV.fetch('TF_VAR_github_token'))
client.protect_branch("#{ARGV[0]}", 'master', {
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

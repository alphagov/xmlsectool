module "repo_verify_puppet" {
  source = "./verify_repo"

  name = "verify-puppet"
  description = "Puppet code for GOV.UK Verify"
  private = "true"
  push_teams = [
        "${data.github_team.core.id}",
        "${data.github_team.infrastructure.id}",
      ]
}

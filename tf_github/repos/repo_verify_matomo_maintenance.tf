module "repo_verify_matomo_utils" {
  source = "./verify_repo"

  name = "verify-matomo-utils"
  description = "Collection of tools used for interacting with Matomo (formerly called Piwik)"
  private = "false"
  push_teams = [
    "${data.github_team.core.id}",
  ]
}

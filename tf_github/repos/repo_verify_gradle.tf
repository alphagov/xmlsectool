module "repo_verify_gradle" {
  source = "./verify_repo"

  name = "verify-gradle"
  description = "Contains gradle plugins authored by the GOV.UK Verify team"
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

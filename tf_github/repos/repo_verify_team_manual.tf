module "repo_verify_team_manual" {
  source = "./verify_repo"

  name = "verify-team-manual"
  description = ""
  private = "true"
  push_teams = [
        "verify-tech-team-core",
      ]
}

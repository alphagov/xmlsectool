module "repo_verify_frontend" {
  source = "./verify_repo"

  name = "verify-frontend"
  description = "The frontend service for GOV.UK Verify"
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

module "repo_verify_token_service" {
  source = "./verify_repo"

  name = "verify-token-service"
  description = "Verify Token Service"
  archived = "true"
  private = "true"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

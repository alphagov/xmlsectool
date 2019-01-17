module "repo_verify_token_service" {
  source = "./verify_repo"

  name = "verify-token-service"
  description = "Verify Token Service"
  private = "true"
  push_teams = [
        "verify-tech-team-core",
      ]
}

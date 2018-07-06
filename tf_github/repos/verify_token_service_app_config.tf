module "repo_verify_token_service_app_config" {
  source = "./verify_repo"

  name = "verify-token-service-app-config"
  description = "Token Service app config"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

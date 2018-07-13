module "repo_verify_frontend_app_config" {
  source = "./verify_repo"

  name = "verify-frontend-app-config"
  description = "App config for the Verify Rails frontend"
  private = "true"
  push_teams = [
        "verify-tech-team-frontend",
      ]
}

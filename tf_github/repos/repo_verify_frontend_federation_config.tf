module "repo_verify_frontend_federation_config" {
  source = "./verify_repo"

  name = "verify-frontend-federation-config"
  description = "Federation configuration for the Verify frontend"
  private = "true"
  push_teams = [
        "verify-tech-team-frontend",
      ]
}

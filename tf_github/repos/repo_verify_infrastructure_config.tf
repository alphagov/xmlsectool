module "repo_verify_infrastructure_config" {
  source = "./verify_repo"

  name        = "verify-infrastructure-config"
  description = "ECS Hub Config (including the CI/CD pipeline)"
  private     = "true"

  push_teams = [
    "verify-tech-team-core",
    "verify-tech-team-infrastructure",
  ]
}

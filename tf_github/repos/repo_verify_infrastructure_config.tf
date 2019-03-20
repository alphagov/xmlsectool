module "repo_verify_infrastructure_config" {
  source = "./verify_repo"

  name        = "verify-infrastructure-config"
  description = "ECS Hub Config (including the CI/CD pipeline)"
  private     = "true"

  push_teams = [
    "${data.github_team.core.id}",
    "${data.github_team.infrastructure.id}",
  ]
}

module "repo_verify_infrastructure" {
  source = "./verify_repo"

  name        = "verify-infrastructure"
  description = "Infrastructure code for Verify Hub ECS"
  private     = "false"

  push_teams = [
    "${data.github_team.core.id}",
    "${data.github_team.infrastructure.id}",
  ]
}

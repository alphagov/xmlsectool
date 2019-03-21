module "repo_verify_self_service" {
  source = "./verify_repo"

  name = "verify-self-service"
  description = "Verify self-service platform"
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

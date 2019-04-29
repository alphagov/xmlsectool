module "repo_verify_hub" {
  source = "./verify_repo"

  name = "verify-hub"
  description = "Verify Hub Microservices"
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

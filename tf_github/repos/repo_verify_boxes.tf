module "repo_verify_boxes" {
  source = "./verify_repo"

  name = "verify-boxes"
  description = "Verify specific configuration for vcloud-launch "
  private = "true"
  push_teams = [
        "${data.github_team.core.id}",
        "${data.github_team.infrastructure.id}",
      ]
}

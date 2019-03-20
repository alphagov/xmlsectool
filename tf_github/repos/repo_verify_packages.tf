module "repo_verify_packages" {
  source = "./verify_repo"

  name = "verify-packages"
  description = "Builds custom ubuntu packages used for Verify systems"
  private = "true"
  push_teams = [
        "${data.github_team.core.id}",
        "${data.github_team.infrastructure.id}",
  ]
}

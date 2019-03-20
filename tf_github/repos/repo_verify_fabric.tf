module "repo_verify_fabric" {
  source = "./verify_repo"

  name = "verify-fabric"
  description = " Fabric for Verify "
  private = "true"
  push_teams = [
        "${data.github_team.core.id}",
        "${data.github_team.infrastructure.id}",
      ]
}

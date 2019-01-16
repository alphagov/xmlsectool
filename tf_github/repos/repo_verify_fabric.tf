module "repo_verify_fabric" {
  source = "./verify_repo"

  name = "verify-fabric"
  description = " Fabric for Verify "
  private = "true"
  push_teams = [
        "verify-tech-team-core",
        "verify-tech-team-infrastructure",
      ]
}

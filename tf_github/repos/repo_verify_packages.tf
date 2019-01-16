module "repo_verify_packages" {
  source = "./verify_repo"

  name = "verify-packages"
  description = "Builds custom ubuntu packages used for Verify systems"
  private = "true"
  push_teams = [
        "verify-tech-team-core",
        "verify-tech-team-infrastructure",
  ]
}

module "repo_verify_utils_libs" {
  source = "./verify_repo"

  name = "verify-utils-libs"
  description = "Libraries used across multiple Verify projects"
  private = "false"
  push_teams = [
        "verify-tech-team-core-hub",
        "verify-tech-team-dcs",
      ]
}

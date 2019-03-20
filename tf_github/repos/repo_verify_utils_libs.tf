module "repo_verify_utils_libs" {
  source = "./verify_repo"

  name = "verify-utils-libs"
  description = "Libraries used across multiple Verify projects"
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

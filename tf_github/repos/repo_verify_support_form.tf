module "repo_verify_support_form" {
  source = "./verify_repo"

  name = "verify-support-form"
  description = "Verify support form"
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

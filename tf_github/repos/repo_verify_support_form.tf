module "repo_verify_support_form" {
  source = "./verify_repo"

  name = "verify-support-form"
  description = "Verify support form"
  private = "false"
  push_teams = [
        "verify-tech-team-core",
      ]
}

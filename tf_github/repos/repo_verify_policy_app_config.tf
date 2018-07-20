module "repo_verify_policy_app_config" {
  source = "./verify_repo"

  name = "verify-policy-app-config"
  description = "Application config for Policy app"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

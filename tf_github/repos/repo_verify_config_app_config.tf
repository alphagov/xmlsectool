module "repo_verify_config_app_config" {
  source = "./verify_repo"

  name = "verify-config-app-config"
  description = "Repo for Verify Config services application config"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

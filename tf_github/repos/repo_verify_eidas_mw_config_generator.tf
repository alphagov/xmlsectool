module "repo_verify_eidas_mw_config_generator" {
  source = "./verify_repo"

  name = "verify-eidas-mw-config-generator"
  description = "eIDAS Middleware Configuration Generator"
  private = "false"
  push_teams = [
        "${data.github_team.eidas.id}",
      ]
}

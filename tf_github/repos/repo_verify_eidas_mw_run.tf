module "repo_verify_eidas_mw_run" {
  source = "./verify_repo"

  name = "verify-eidas-mw-run"
  description = "German eIDAS middleware run container"
  private = "false"
  push_teams = [
        "${data.github_team.eidas.id}",
      ]
}

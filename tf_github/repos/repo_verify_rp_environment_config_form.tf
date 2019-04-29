module "repo_verify_rp_environment_config_form" {
  source = "./verify_repo"

  name = "verify-rp-environment-config-form"
  description = " :page_with_curl: The form for relying parties to provide Verify with environment configuration"
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

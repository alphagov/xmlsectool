module "repo_verify_stub_idp_federation_config" {
  source = "./verify_repo"

  name = "verify-stub-idp-federation-config"
  description = "Federation config for verify-stub-idp"
  private = "true"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

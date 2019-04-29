module "repo_verify_stub_idp" {
  source = "./verify_repo"

  name = "verify-stub-idp"
  description = "Stub Identity Provider and Stub eIDAS Proxy Service Node used for testing GOV.UK Verify"
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

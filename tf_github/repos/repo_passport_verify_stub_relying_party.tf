module "repo_passport_verify_stub_relying_party" {
  source = "./verify_repo"

  name = "passport-verify-stub-relying-party"
  description = "Stub Relying party that integrates with Verify using the passport-verify library"
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

module "repo_verify_metadata" {
  source = "./verify_repo"

  name = "verify-metadata"
  description = "Verify SAML metadata sources"
  private = "true"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

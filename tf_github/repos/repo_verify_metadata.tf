module "repo_verify_metadata" {
  source = "./verify_repo"

  name = "verify-metadata"
  description = "Verify SAML metadata sources"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
        "verify-tech-team-connecting",
      ]
}

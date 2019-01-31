module "repo_metadata_checker" {
  source = "./verify_repo"

  name        = "metadata-checker"
  description = "Tools for parsing and monitoring SAML metadata"
  private     = "false"

  push_teams = [
    "verify-tech-team-core",
    "verify-tech-team-infrastructure",
  ]
}

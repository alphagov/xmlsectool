module "repo_verify_eidas_metadata_aggregator" {
  source = "./verify_repo"

  name = "verify-eidas-metadata-aggregator"
  description = "Script to aggregate SAML metadata from EU countries"
  private = "false"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

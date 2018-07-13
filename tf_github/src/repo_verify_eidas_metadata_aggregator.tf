module "repo_verify_eidas_metadata_aggregator" {
  source = "./verify_repo"

  name = "verify-eidas-metadata-aggregator"
  description = "Script to aggregate metadata from EU countries"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

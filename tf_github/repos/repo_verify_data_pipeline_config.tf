module "repo_verify_data_pipeline_config" {
  source = "./verify_repo"

  name = "verify-data-pipeline-config"
  description = "Holds configuration data to help verify data pipeline run in production"
  private = "true"
  push_teams = [
        "verify-tech-team-core",
      ]
}

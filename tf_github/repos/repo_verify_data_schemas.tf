module "repo_verify_data_schemas" {
  source = "./verify_repo"

  name = "verify-data-schemas"
  description = "YAML specifications for Verify data"
  private = "false"
  push_teams = [
        "verify-tech-team-performance-pa",
        "verify-tech-team-performance-dev",
      ]
}

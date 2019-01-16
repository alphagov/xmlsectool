module "repo_verify_data_pipeline" {
  source = "./verify_repo"

  name = "verify-data-pipeline"
  description = "Manages Analytics code that generates statistics that inform journey improvements"
  private = "true"
  push_teams = [
        "verify-tech-team-core",
      ]
}

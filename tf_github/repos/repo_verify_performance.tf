module "repo_verify_performance" {
  source = "./verify_repo"

  name = "verify-performance"
  description = "Repo for the Verify performance and data team"
  private = "true"
  push_teams = [
        "verify-tech-team-performance-pa",
        "verify-tech-team-performance-dev",
      ]
}

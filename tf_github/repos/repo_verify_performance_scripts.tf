module "repo_verify_performance_scripts" {
  source = "./verify_repo"

  name = "verify-performance-scripts"
  description = "Scripts related to verify performance"
  private = "false"
  push_teams = [
        "verify-tech-team-performance-pa",
        "verify-tech-team-performance-dev",
      ]
}

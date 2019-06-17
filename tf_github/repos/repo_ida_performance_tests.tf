module "repo_ida_performance_tests" {
  source = "./verify_repo"

  name = "ida-performance-tests"
  description = "Verify Performance Testing (temporary)"
  private = "true"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

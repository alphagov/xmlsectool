module "repo_dcs_performance_tests" {
  source = "./verify_repo"

  name = "dcs-performance-tests"
  description = "Verify DCS Performance Tests"
  private = "true"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

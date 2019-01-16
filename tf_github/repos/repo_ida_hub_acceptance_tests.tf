module "repo_ida_hub_acceptance_tests" {
  source = "./verify_repo"

  name = "ida-hub-acceptance-tests"
  description = "Verify Hub acceptance tests (temporary)"
  private = "true"
  push_teams = [
        "verify-tech-team-core",
      ]
}

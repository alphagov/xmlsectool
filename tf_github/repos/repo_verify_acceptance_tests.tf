module "repo_verify_acceptance_tests" {
  source = "./verify_repo"

  name = "verify-acceptance-tests"
  description = "End-to-end tests for the Verify Hub"
  private = "false"
  push_teams = [
        "verify-tech-team-core-hub",
        "verify-tech-team-connecting",
      ]
}

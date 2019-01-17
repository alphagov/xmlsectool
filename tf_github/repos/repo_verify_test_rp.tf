module "repo_verify_test_rp" {
  source = "./verify_repo"

  name = "verify-test-rp"
  description = "Verify Test Relying Party"
  private = "false"
  push_teams = [
        "verify-tech-team-core",
      ]
}

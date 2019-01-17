module "repo_verify_test_repo" {
  source = "./verify_repo"

  name = "verify-test-repo"
  description = "Test repo"
  private = "false"
  push_teams = [
        "verify-tech-team-core",
      ]
}


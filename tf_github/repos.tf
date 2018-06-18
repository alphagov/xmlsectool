module "verify_test_repo" {
  source = "./verify_repo"

  name = "verify-test-repo"
  description = "Test repo"
  master_users = [ "vixus0" ]
  push_teams = [ "${github_team.verify_test_team.id}" ]
}

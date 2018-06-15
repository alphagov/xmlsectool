module "verify_test_repo" {
  source = "./verify_repo"

  name = "verify-test-repo"
  description = "Test repo"
  master_users = [ "vixus0" ]
  push_teams = [ "${module.verify_test_team.name}" ]
  push_team_count = 1
}

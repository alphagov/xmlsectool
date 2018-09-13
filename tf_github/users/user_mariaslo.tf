module "user_mariaslo" {
  source = "./verify_user"

  username = "mariaslo"
  realname = "Maria Lopez Oller"
  org_role = "member"
  teams = [ "${module.mission_performance_pa.teams}" ]
}

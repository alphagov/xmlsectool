module "user_donnabelsey" {
  source = "./verify_user"

  username = "donnabelsey"
  realname = "Donna Belsey"
  org_role = "member"
  teams = [ "${module.mission_performance.teams}" ]
}

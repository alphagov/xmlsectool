module "user_chrisholmes" {
  source = "./verify_user"

  username = "chrisholmes"
  realname = "Christopher Holmes"
  org_role = "admin"
  teams = [ "${module.mission_all.teams}" ]
}

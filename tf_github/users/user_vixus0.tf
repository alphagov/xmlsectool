module "user_vixus0" {
  source = "./verify_user"

  username = "vixus0"
  realname = "Anshul Sirur"
  org_role = "admin"
  teams = [ "${module.mission_all.teams}" ]
}

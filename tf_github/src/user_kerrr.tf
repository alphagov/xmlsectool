module "user_kerrr" {
  source = "./verify_user"

  username = "kerrr"
  realname = "Kerr Rainey"
  org_role = "member"
  teams = [ "${module.mission_eidas.teams}" ]
}

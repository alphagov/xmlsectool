module "user_jhjava" {
  source = "./verify_user"

  username = "JHjava"
  realname = "James Howes"
  org_role = "admin"
  teams = [ "${module.mission_eidas.teams}" ]
}

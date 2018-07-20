module "user_jhjava" {
  source = "./verify_user"

  username = "JHjava"
  realname = "James Howes"
  org_role = "member"
  teams = [ "${module.mission_eidas.teams}" ]
}

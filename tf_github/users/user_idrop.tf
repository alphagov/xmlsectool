module "user_idrop" {
  source = "./verify_user"

  username = "idrop"
  realname = "Phillip Miller"
  org_role = "member"
  teams = [ "${module.mission_eidas.teams}" ]
}

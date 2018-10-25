module "user_tomrosier" {
  source = "./verify_user"

  username = "tomrosier"
  realname = "Tom Rosier"
  org_role = "member"
  teams = [ "${module.mission_eidas.teams}" ]
}

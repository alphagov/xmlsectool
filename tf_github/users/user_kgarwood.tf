module "user_kgarwood" {
  source = "./verify_user"

  username = "kgarwood"
  realname = "Kevin Garwood"
  org_role = "member"
  teams = [ "${module.mission_eidas.teams}" ]
}

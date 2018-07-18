module "user_simonwo" {
  source = "./verify_user"

  username = "simonwo"
  realname = "Simon Worthington"
  org_role = "member"
  teams = [ "${module.mission_eidas.teams}" ]
}

module "user_charlesic" {
  source = "./verify_user"

  username = "CharlesIC"
  realname = "Charles Karol Gancarz"
  org_role = "member"
  teams = [ "${module.mission_eidas.teams}" ]
}

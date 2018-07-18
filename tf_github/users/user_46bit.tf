module "user_46bit" {
  source = "./verify_user"

  username = "46bit"
  realname = "Michael Mokrysz"
  org_role = "member"
  teams = [ "${module.mission_eidas.teams}" ]
}

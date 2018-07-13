module "user_andrewchong" {
  source = "./verify_user"

  username = "andrewchong"
  realname = "Andrew Chong"
  org_role = "member"
  teams = [ "${module.mission_eidas.teams}" ]
}

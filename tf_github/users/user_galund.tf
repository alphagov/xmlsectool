module "user_galund" {
  source = "./verify_user"

  username = "galund"
  realname = "George Lund"
  org_role = "member"
  teams = [ "${module.mission_optimising.teams}" ]
}

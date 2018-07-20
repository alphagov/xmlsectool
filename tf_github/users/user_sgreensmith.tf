module "user_sgreensmith" {
  source = "./verify_user"

  username = "sgreensmith"
  realname = "Simon Greensmith"
  org_role = "member"
  teams = [ "${module.mission_connecting.teams}" ]
}

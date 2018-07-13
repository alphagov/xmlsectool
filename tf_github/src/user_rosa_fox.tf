module "user_rosa_fox" {
  source = "./verify_user"

  username = "Rosa-Fox"
  realname = "Rosa Fox"
  org_role = "member"
  teams = [ "${module.mission_connecting.teams}" ]
}

module "user_alan_gds" {
  source = "./verify_user"

  username = "alan-gds"
  realname = "Alan Carter"
  org_role = "member"
  teams = [ "${module.mission_connecting.teams}" ]
}

module "user_karlbaker02" {
  source = "./verify_user"

  username = "karlbaker02"
  realname = "Karl Baker"
  org_role = "member"
  teams = [ "${module.mission_connecting.teams}" ]
}

module "user_jkunle" {
  source = "./verify_user"

  username = "jkunle"
  realname = "Olakunle Jegede"
  org_role = "member"
  teams = [ "${module.mission_connecting.teams}" ]
}

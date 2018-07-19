module "user_jstandring_gds" {
  source = "./verify_user"

  username = "jstandring-gds"
  realname = "Julian Standring"
  org_role = "member"
  teams = [ "${module.mission_yak.teams}" ]
}

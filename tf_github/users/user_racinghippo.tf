module "user_racinghippo" {
  source = "./verify_user"

  username = "RacingHippo"
  realname = "John Kennard"
  org_role = "member"
  teams = [ "${module.mission_connecting.teams}" ]
}

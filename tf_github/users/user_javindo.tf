module "user_javindo" {
  source = "./verify_user"

  username = "javindo"
  realname = "Steve Butler"
  org_role = "member"
  teams = [ "${module.mission_optimising.teams}" ]
}

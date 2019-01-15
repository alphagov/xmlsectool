module "user_phantas" {
  source = "./verify_user"

  username = "phantas"
  realname = "Paula Valenca"
  org_role = "member"
  teams = [ "${module.mission_optimising.teams}" ]
}

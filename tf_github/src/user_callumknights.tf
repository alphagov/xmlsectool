module "user_callumknights" {
  source = "./verify_user"

  username = "callumknights"
  realname = "Callum Knights"
  org_role = "member"
  teams = [ "${module.mission_optimising.teams}" ]
}

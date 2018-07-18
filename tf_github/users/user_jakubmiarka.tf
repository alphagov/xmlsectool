module "user_jakubmiarka" {
  source = "./verify_user"

  username = "jakubmiarka"
  realname = "Jakub Miarka"
  org_role = "member"
  teams = [ "${module.mission_optimising.teams}" ]
}

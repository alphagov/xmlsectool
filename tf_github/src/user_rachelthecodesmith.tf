module "user_rachelthecodesmith" {
  source = "./verify_user"

  username = "rachelthecodesmith"
  realname = "Rachel Smith"
  org_role = "member"
  teams = [ "${module.mission_optimising.teams}" ]
}

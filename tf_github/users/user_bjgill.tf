module "user_bjgill" {
  source = "./verify_user"

  username = "bjgill"
  realname = "Benjamin Gill"
  org_role = "member"
  teams = [ "${module.mission_optimising.teams}" ]
}

module "user_nacnudus" {
  source = "./verify_user"

  username = "nacnudus"
  realname = "Duncan Garmonsway"
  org_role = "member"
  teams = [ "${module.mission_optimising.teams}" ]
}

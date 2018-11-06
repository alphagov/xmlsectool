module "user_johnwattsgds" {
  source = "./verify_user"

  username = "johnwattsgds"
  realname = "John Watts"
  org_role = "member"
  teams = [ "${module.mission_optimising.teams}" ]
}

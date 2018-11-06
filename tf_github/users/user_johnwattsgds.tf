module "user_johnwattsgds" {
  source = "./verify_user"

  username = "JohnWattsGDS"
  realname = "John Watts"
  org_role = "member"
  teams = [ "${module.mission_optimising.teams}" ]
}

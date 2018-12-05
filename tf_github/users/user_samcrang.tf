module "user_samcrang" {
  source = "./verify_user"

  username = "samcrang"
  realname = "Sam Crang"
  org_role = "member"
  teams = [ "${module.mission_eidas.teams}" ]
}

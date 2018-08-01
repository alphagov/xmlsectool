module "user_guruchand" {
  source = "./verify_user"

  username = "guruchand"
  realname = "Guruprasad Chandramouli"
  org_role = "member"
  teams = [ "${module.mission_eidas.teams}" ]
}

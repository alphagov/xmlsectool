module "user_rhowe_gds" {
  source = "./verify_user"

  username = "rhowe-gds"
  realname = "Russell Howe"
  org_role = "admin"
  teams = [ "${module.mission_re.teams}" ]
}

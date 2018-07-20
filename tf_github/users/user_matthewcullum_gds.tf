module "user_matthewcullum_gds" {
  source = "./verify_user"

  username = "matthewcullum-gds"
  realname = "Matthew Cullum"
  org_role = "member"
  teams = [ "${module.mission_re.teams}" ]
}

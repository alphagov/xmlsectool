module "user_matthewcullum_gds" {
  source = "./verify_user"

  username = "matthewcullum-gds"
  realname = "Matthew Cullum"
  org_role = "member"
  teams = [ "${data.github_team.infrastructure.id}" ]
}

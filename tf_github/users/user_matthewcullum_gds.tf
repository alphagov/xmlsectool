module "user_matthewcullum_gds" {
  source = "./verify_user"

  username  = "matthewcullum-gds"
  realname  = "Matthew Cullum"
  can_merge = "true"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.infrastructure.id}",
  ]
}

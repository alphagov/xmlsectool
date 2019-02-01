module "user_dbes_gds" {
  source = "./verify_user"

  username = "dbes-gds"
  realname = "Daniel Besbrode"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.eidas.id}",
  ]
}

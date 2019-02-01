module "user_vixus0" {
  source = "./verify_user"

  username     = "vixus0"
  realname     = "Anshul Sirur"
  verify_admin = "true"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.eidas.id}",
    "${data.github_team.infrastructure.id}",
  ]
}

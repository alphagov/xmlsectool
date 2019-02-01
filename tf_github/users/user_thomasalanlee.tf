module "user_thomasalanlee" {
  source = "./verify_user"

  username     = "thomasalanlee"
  realname     = "Thomas Lee"
  verify_admin = "true"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.eidas.id}",
    "${data.github_team.infrastructure.id}",
  ]
}

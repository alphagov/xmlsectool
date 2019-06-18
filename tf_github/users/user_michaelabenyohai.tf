module "user_michaelabenyohai" {
  source = "./verify_user"

  username  = "michaelabenyohai"
  realname  = "Michaela Benyohai"
  can_merge = "true"
  verify_admin = "true"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.eidas.id}",
    "${data.github_team.infrastructure.id}",
  ]
}

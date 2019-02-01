module "user_benjamin_mortimer" {
  source = "./verify_user"

  username = "benjamin-mortimer"
  realname = "Benjamin Mortimer"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.eidas.id}",
  ]
}

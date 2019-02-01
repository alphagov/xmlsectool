module "user_charlesic" {
  source = "./verify_user"

  username = "CharlesIC"
  realname = "Charles Karol Gancarz"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.eidas.id}",
  ]
}

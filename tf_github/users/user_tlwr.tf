module "user_tlwr" {
  source = "./verify_user"

  username = "tlwr"
  realname = "Toby Lorne"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.infrastructure.id}",
  ]
}

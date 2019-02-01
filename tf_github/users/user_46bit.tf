module "user_46bit" {
  source = "./verify_user"

  username = "46bit"
  realname = "Michael Mokrysz"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.infrastructure.id}",
  ]
}

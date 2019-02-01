module "user_robinmitra" {
  source = "./verify_user"

  username = "robinmitra"
  realname = "Robin Mitra"

  teams = ["${data.github_team.core.id}"]
}

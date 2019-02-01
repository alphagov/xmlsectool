module "user_mikieet" {
  source = "./verify_user"

  username = "mikieet"
  realname = "Michael Thomas"

  teams = ["${data.github_team.core.id}"]
}

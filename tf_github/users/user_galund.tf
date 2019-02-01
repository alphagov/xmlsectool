module "user_galund" {
  source = "./verify_user"

  username = "galund"
  realname = "George Lund"

  teams = ["${data.github_team.core.id}"]
}

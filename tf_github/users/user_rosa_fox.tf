module "user_rosa_fox" {
  source = "./verify_user"

  username = "Rosa-Fox"
  realname = "Rosa Fox"

  teams = ["${data.github_team.core.id}"]
}

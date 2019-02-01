module "user_j_maynard" {
  source = "./verify_user"

  username = "j-maynard"
  realname = "Jamie Maynard"

  teams = ["${data.github_team.core.id}"]
}

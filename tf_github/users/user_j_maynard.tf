module "user_j_maynard" {
  source = "./verify_user"

  username  = "j-maynard"
  realname  = "Jamie Maynard"
  can_merge = "false"

  teams = ["${data.github_team.core.id}"]
}

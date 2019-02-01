module "user_rosa_fox" {
  source = "./verify_user"

  username  = "Rosa-Fox"
  realname  = "Rosa Fox"
  can_merge = "true"

  teams = ["${data.github_team.core.id}"]
}

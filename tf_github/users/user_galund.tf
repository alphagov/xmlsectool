module "user_galund" {
  source = "./verify_user"

  username  = "galund"
  realname  = "George Lund"
  can_merge = "true"

  teams = ["${data.github_team.core.id}"]
}

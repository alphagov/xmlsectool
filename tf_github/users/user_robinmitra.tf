module "user_robinmitra" {
  source = "./verify_user"

  username  = "robinmitra"
  realname  = "Robin Mitra"
  can_merge = "true"

  teams = ["${data.github_team.core.id}"]
}

module "user_mikieet" {
  source = "./verify_user"

  username  = "mikieet"
  realname  = "Michael Thomas"
  can_merge = "false"

  teams = ["${data.github_team.core.id}"]
}

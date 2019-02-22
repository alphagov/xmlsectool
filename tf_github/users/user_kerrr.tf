module "user_kerrr" {
  source = "./verify_user"

  username  = "kerrr"
  realname  = "Kerr Rainey"
  can_merge = "true"

  teams = ["${data.github_team.core.id}"]
}

module "user_richardwalks" {
  source = "./verify_user"

  username  = "richardwalks"
  realname  = "Richard Walker"
  can_merge = "false"

  teams = ["${data.github_team.core.id}"]
}

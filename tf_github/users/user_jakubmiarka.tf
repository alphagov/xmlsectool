module "user_jakubmiarka" {
  source = "./verify_user"

  username     = "jakubmiarka"
  realname     = "Jakub Miarka"
  can_merge    = "true"
  verify_admin = "true"

  teams = ["${data.github_team.core.id}"]
}

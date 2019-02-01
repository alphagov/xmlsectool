module "user_jakubmiarka" {
  source = "./verify_user"

  username     = "jakubmiarka"
  realname     = "Jakub Miarka"
  verify_admin = "true"

  teams = ["${data.github_team.core.id}"]
}

module "user_jakubmiarka" {
  source = "./verify_user"

  username = "jakubmiarka"
  realname = "Jakub Miarka"

  teams = ["${data.github_team.core.id}"]
}

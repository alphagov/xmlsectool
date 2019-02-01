module "user_callumknights" {
  source = "./verify_user"

  username = "callumknights"
  realname = "Callum Knights"

  teams = ["${data.github_team.core.id}"]
}

module "user_callumknights" {
  source = "./verify_user"

  username  = "callumknights"
  realname  = "Callum Knights"
  can_merge = "true"

  teams = ["${data.github_team.core.id}"]
}

module "user_alexandergeegds" {
  source = "./verify_user"

  username  = "alexandergeegds"
  realname  = "Alex Gee"
  can_merge = "true"

  teams = ["${data.github_team.core.id}"]
}

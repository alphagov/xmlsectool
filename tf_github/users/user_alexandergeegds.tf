module "user_alexandergeegds" {
  source = "./verify_user"

  username = "alexandergeegds"
  realname = "Alex Gee"

  teams = ["${data.github_team.core.id}"]
}

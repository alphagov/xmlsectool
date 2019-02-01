module "user_chrisclayson" {
  source = "./verify_user"

  username = "chrisclayson"
  realname = "Chris Clayson"

  teams = ["${data.github_team.core.id}"]
}

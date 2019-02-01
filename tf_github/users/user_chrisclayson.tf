module "user_chrisclayson" {
  source = "./verify_user"

  username  = "chrisclayson"
  realname  = "Chris Clayson"
  can_merge = "true"

  teams = ["${data.github_team.core.id}"]
}

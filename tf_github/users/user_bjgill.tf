module "user_bjgill" {
  source = "./verify_user"

  username  = "bjgill"
  realname  = "Benjamin Gill"
  can_merge = "false"

  teams = ["${data.github_team.core.id}"]
}

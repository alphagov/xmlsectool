module "user_bjgill" {
  source = "./verify_user"

  username = "bjgill"
  realname = "Benjamin Gill"

  teams = ["${data.github_team.core.id}"]
}

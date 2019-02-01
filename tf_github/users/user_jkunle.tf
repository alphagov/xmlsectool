module "user_jkunle" {
  source = "./verify_user"

  username = "jkunle"
  realname = "Olakunle Jegede"

  teams = ["${data.github_team.core.id}"]
}

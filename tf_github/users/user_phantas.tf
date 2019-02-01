module "user_phantas" {
  source = "./verify_user"

  username = "phantas"
  realname = "Paula Valenca"

  teams = ["${data.github_team.core.id}"]
}

module "user_phantas" {
  source = "./verify_user"

  username     = "phantas"
  realname     = "Paula Valenca"
  verify_admin = "true"

  teams = ["${data.github_team.core.id}"]
}

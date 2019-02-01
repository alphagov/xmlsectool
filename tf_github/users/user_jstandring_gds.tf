module "user_jstandring_gds" {
  source = "./verify_user"

  username = "jstandring-gds"
  realname = "Julian Standring"

  teams = ["${data.github_team.infrastructure.id}"]
}

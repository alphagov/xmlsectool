module "user_jstandring_gds" {
  source = "./verify_user"

  username  = "jstandring-gds"
  realname  = "Julian Standring"
  can_merge = "true"

  teams = ["${data.github_team.infrastructure.id}"]
}

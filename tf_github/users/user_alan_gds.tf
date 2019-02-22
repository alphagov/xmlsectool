module "user_alan_gds" {
  source = "./verify_user"

  username  = "alan-gds"
  realname  = "Alan Carter"
  can_merge = "true"

  teams = ["${data.github_team.core.id}"]
}

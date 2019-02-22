module "user_nacnudus" {
  source = "./verify_user"

  username  = "nacnudus"
  realname  = "Duncan Garmonsway"
  can_merge = "false"

  teams = ["${data.github_team.core.id}"]
}

module "user_nacnudus" {
  source = "./verify_user"

  username = "nacnudus"
  realname = "Duncan Garmonsway"

  teams = ["${data.github_team.core.id}"]
}

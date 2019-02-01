module "user_jhjava" {
  source = "./verify_user"

  username     = "JHjava"
  realname     = "James Howes"
  can_merge    = "true"
  verify_admin = "true"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.eidas.id}",
  ]
}

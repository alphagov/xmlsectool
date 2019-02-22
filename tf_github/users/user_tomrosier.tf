module "user_tomrosier" {
  source = "./verify_user"

  username  = "tomrosier"
  realname  = "Tom Rosier"
  can_merge = "true"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.eidas.id}",
  ]
}

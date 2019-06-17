module "user_instantiator" {
  source = "./verify_user"

  username  = "instantiator"
  realname  = "Lewis Westbury"
  can_merge = "false"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.eidas.id}",
  ]
}

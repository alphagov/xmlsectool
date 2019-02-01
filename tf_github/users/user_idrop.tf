module "user_idrop" {
  source = "./verify_user"

  username  = "idrop"
  realname  = "Phillip Miller"
  can_merge = "true"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.eidas.id}",
  ]
}

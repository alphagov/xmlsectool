module "user_sistephens" {
  source = "./verify_user"

  username  = "sistephens"
  realname  = "Si Stephens-Manassiev"
  can_merge = "false"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.eidas.id}",
  ]
}

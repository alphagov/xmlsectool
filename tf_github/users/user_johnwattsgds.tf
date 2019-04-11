module "user_johnwattsgds" {
  source = "./verify_user"

  username  = "JohnWattsGDS"
  realname  = "John Watts"
  can_merge = "true"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.eidas.id}",
  ]
}

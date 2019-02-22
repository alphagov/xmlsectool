module "user_johnwattsgds" {
  source = "./verify_user"

  username  = "JohnWattsGDS"
  realname  = "John Watts"
  can_merge = "false"

  teams = ["${data.github_team.core.id}"]
}

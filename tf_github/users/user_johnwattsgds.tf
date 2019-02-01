module "user_johnwattsgds" {
  source = "./verify_user"

  username = "JohnWattsGDS"
  realname = "John Watts"

  teams = ["${data.github_team.core.id}"]
}

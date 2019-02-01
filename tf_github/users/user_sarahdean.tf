module "user_sarahdean" {
  source = "./verify_user"

  username = "sarah-dean"
  realname = "Sarah Dean"

  teams = ["${data.github_team.core.id}"]
}

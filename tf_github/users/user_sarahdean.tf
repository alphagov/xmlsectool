module "user_sarahdean" {
  source = "./verify_user"

  username  = "sarah-dean"
  realname  = "Sarah Dean"
  can_merge = "false"

  teams = ["${data.github_team.core.id}"]
}

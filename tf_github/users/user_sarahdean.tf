module "user_sarahdean" {
  source = "./verify_user"

  username = "sarah-dean"
  realname = "Sarah Dean"
  org_role = "member"
  teams = [ "${module.mission_performance_pa.teams}" ]
}

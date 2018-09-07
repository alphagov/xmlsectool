module "user_sarahdean" {
  source = "./verify_user"

  username = "sarah-dean"
  realname = "Sarah Dean"
  org_role = "member"
  teams = [ "verify-tech-team-performance-pa" ]
}

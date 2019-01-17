module "user_kerrr" {
  source = "./verify_user"

  username = "kerrr"
  realname = "Kerr Rainey"
  org_role = "member"
  teams = [ "${data.github_team.core.id}" ]
}

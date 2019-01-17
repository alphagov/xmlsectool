module "user_mikieet" {
  source = "./verify_user"

  username = "mikieet"
  realname = "Michael Thomas"
  org_role = "member"
  teams = [ "${data.github_team.core.id}" ]
}

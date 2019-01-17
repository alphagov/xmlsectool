module "user_robinmitra" {
  source = "./verify_user"

  username = "robinmitra"
  realname = "Robin Mitra"
  org_role = "member"
  teams = [ "${data.github_team.core.id}" ]
}

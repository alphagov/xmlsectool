module "user_amritsidhu" {
  source = "./verify_user"

  username = "AmritSidhu"
  realname = "Amrit Sidhu"
  org_role = "member"
  teams = [ "${data.github_team.core.id}" ]
}

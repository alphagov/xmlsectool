module "user_chrisclayson" {
  source = "./verify_user"

  username = "chrisclayson"
  realname = "Chris Clayson"
  org_role = "member"
  teams = [ "${data.github_team.core.id}" ]
}

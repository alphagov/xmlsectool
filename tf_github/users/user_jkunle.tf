module "user_jkunle" {
  source = "./verify_user"

  username = "jkunle"
  realname = "Olakunle Jegede"
  org_role = "member"
  teams = [ "${data.github_team.core.id}" ]
}

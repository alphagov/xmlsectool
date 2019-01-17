module "user_phantas" {
  source = "./verify_user"

  username = "phantas"
  realname = "Paula Valenca"
  org_role = "member"
  teams = [ "${data.github_team.core.id}" ]
}

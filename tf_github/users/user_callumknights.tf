module "user_callumknights" {
  source = "./verify_user"

  username = "callumknights"
  realname = "Callum Knights"
  org_role = "member"
  teams = [ "${data.github_team.core.id}" ]
}

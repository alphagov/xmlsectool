module "user_alexandergeegds" {
  source = "./verify_user"

  username = "alexandergeegds"
  realname = "Alex Gee"
  org_role = "member"
  teams = [ "${data.github_team.core.id}" ]
}

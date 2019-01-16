module "user_ejrowley" {
  source = "./verify_user"

  username = "ejrowley"
  realname = "Ed Rowley"
  org_role = "member"
  teams = [ "${data.github_team.infrastructure.id}" ]
}

module "user_mariaslo" {
  source = "./verify_user"

  username = "Mariaslo"
  realname = "Maria Lopez Oller"
  org_role = "member"
  teams = [ "${data.github_team.core.id}" ]
}

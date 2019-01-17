module "user_mhussein_gds" {
  source = "./verify_user"

  username = "mhussein-gds"
  realname = "Muhammed Hussein"
  org_role = "member"
  teams = [ "${data.github_team.core.id}" ]
}

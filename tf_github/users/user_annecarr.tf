module "user_annecarr" {
  source = "./verify_user"

  username = "AnneCarr"
  realname = "Anne Carr"
  org_role = "member"
  teams = [ "${data.github_team.core.id}" ]
}

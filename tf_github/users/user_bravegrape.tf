module "user_bravegrape" {
  source = "./verify_user"

  username = "bravegrape"
  realname = "Andrea Szollossi"
  org_role = "member"
  teams = [ "${data.github_team.core.id}" ]
}

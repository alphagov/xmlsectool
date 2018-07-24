module "user_blairboy362" {
  source = "./verify_user"

  username = "blairboy362"
  realname = "Daniel Blair"
  org_role = "member"
  teams = [ "${module.mission_re.teams}" ]
}

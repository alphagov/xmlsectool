module "user_dougneal" {
  source = "./verify_user"

  username = "dougneal"
  realname = "Doug Neal"
  org_role = "member"
  teams = [ "${module.mission_re.teams}" ]
}

module "user_tlwr" {
  source = "./verify_user"

  username = "tlwr"
  realname = "Toby Lorne"
  org_role = "member"
  teams = [ "${module.mission_re.teams}" ]
}
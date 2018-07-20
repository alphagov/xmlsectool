module "user_mmhmm" {
  source = "./verify_user"

  username = "mmhmm"
  realname = "Mark Hynes"
  org_role = "member"
  teams = [ "${module.mission_re.teams}" ]
}

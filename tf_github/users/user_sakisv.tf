module "user_sakisv" {
  source = "./verify_user"

  username = "sakisv"
  realname = "Athanasios Voutsadakis"
  org_role = "member"
  teams = [ "${module.mission_re.teams}" ]
}

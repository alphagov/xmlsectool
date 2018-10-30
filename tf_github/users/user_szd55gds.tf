module "user_szd55gds" {
  source = "./verify_user"

  username = "szd55gds"
  realname = "David Pye"
  org_role = "member"
  teams = [ "${module.mission_re.teams}" ]
}

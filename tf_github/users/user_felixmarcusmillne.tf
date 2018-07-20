module "user_felixmarcusmillne" {
  source = "./verify_user"

  username = "FelixMarcusMillne"
  realname = "Felix Millne"
  org_role = "member"
  teams = [ "${module.mission_eidas.teams}" ]
}

module "user_chris_wynne" {
  source = "./verify_user"

  username = "Wynndow"
  realname = "Chris Wynne"
  org_role = "member"
  teams = [ "${module.mission_eidas.teams}" ]
}

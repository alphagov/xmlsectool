module "user_ronocg" {
  source = "./verify_user"

  username = "ronocg"
  realname = "Conor Glynn"
  org_role = "member"
  teams = [ "${module.mission_re.teams}" ]
}

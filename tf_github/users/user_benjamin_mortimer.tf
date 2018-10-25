module "user_benjamin_mortimer" {
  source = "./verify_user"

  username = "benjamin-mortimer"
  realname = "Benjamin Mortimer"
  org_role = "member"
  teams = [ "${module.mission_eidas.teams}" ]
}

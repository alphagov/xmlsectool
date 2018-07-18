module "user_andy_paine" {
  source = "./verify_user"

  username = "andy-paine"
  realname = "Andy Paine"
  org_role = "member"
  teams = [ "${module.mission_all.teams}" ]
}

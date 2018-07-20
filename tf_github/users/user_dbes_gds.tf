module "user_dbes_gds" {
  source = "./verify_user"

  username = "dbes-gds"
  realname = "Daniel Besbrode"
  org_role = "member"
  teams = [ "${module.mission_billing.teams}" ]
}

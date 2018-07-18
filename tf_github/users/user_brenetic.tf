module "user_brenetic" {
  source = "./verify_user"

  username = "brenetic"
  realname = "Brendan Butler"
  org_role = "member"
  teams = [ "${module.mission_billing.teams}" ]
}

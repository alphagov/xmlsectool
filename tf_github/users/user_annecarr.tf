module "user_annecarr" {
  source = "./verify_user"

  username = "AnneCarr"
  realname = "Anne Carr"
  org_role = "member"
  teams = [ "${module.mission_performance_pa.teams}" ]
}

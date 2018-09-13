module "user_annecarr" {
  source = "./verify_user"

  username = "annecarr"
  realname = "Anne Carr"
  org_role = "member"
  teams = [ "${module.mission_performance_pa.teams}" ]
}

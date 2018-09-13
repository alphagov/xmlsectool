module "user_zilnhoj" {
  source = "./verify_user"

  username = "zilnhoj"
  realname = "John Byrne"
  org_role = "member"
  teams = [ "${module.mission_performance_pa.teams}" ]
}

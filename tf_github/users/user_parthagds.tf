module "user_parthagds" {
  source = "./verify_user"

  username = "parthagds"
  realname = "Partha Mondal"
  org_role = "member"
  teams = [ "${module.mission_connecting.teams}" ]
}

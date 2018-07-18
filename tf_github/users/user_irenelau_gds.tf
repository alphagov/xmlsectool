module "user_irenelau_gds" {
  source = "./verify_user"

  username = "IreneLau-GDS"
  realname = "Irene Lau"
  org_role = "admin"
  teams = [ "${module.mission_all.teams}" ]
}

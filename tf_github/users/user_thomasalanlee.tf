module "user_thomasalanlee" {
  source = "./verify_user"

  username = "thomasalanlee"
  realname = "Thomas Lee"
  org_role = "admin"
  teams = [ "${module.mission_all.teams}" ]
}

module "user_smford" {
  source = "./verify_user"

  username = "smford"
  realname = "Stephen Ford"
  org_role = "admin"
  teams = [ "${module.mission_re.teams}" ]
}

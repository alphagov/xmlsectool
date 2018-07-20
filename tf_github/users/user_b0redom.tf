module "user_b0redom" {
  source = "./verify_user"

  username = "b0redom"
  realname = "Tom Skelley"
  org_role = "member"
  teams = [ "${module.mission_re.teams}" ]
}

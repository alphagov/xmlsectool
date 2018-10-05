module "user_adityapahuja" {
  source = "./verify_user"

  username = "adityapahuja"
  realname = "Aditya Pahuja"
  org_role = "member"
  teams = [ "${module.mission_re.teams}" ]
}

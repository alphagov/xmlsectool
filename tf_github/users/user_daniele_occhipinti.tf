module "user_daniele_occhipinti" {
  source = "./verify_user"

  username = "daniele-occhipinti"
  realname = "Daniele Occhipinti"
  org_role = "member"
  teams = [ "${module.mission_optimising.teams}" ]
}

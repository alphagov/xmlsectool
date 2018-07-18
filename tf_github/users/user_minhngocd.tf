module "user_minhngocd" {
  source = "./verify_user"

  username = "minhngocd"
  realname = "Minno Dang"
  org_role = "member"
  teams = [ "${module.mission_eidas.teams}" ]
}

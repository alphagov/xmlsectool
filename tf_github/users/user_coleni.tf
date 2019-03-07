module "user_coleni" {
  source = "./verify_user"

  username     = "coleni"
  realname     = "Nicole Tinti"
  can_merge    = "false"
  verify_admin = "false"

  teams = ["${data.github_team.core.id}"]
}

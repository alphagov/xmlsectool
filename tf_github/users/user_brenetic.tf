module "user_brenetic" {
  source = "./verify_user"

  username     = "brenetic"
  realname     = "Brendan Butler"
  can_merge    = "true"
  verify_admin = "true"

  teams = ["${data.github_team.core.id}"]
}

module "user_brenetic" {
  source = "./verify_user"

  username     = "brenetic"
  realname     = "Brendan Butler"
  verify_admin = "true"

  teams = ["${data.github_team.core.id}"]
}

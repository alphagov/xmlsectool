module "user_brenetic" {
  source = "./verify_user"

  username = "brenetic"
  realname = "Brendan Butler"

  teams = ["${data.github_team.core.id}"]
}

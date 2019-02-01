module "user_bravegrape" {
  source = "./verify_user"

  username = "bravegrape"
  realname = "Andrea Szollossi"

  teams = ["${data.github_team.core.id}"]
}

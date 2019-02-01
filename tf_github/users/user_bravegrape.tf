module "user_bravegrape" {
  source = "./verify_user"

  username  = "bravegrape"
  realname  = "Andrea Szollossi"
  can_merge = "true"

  teams = ["${data.github_team.core.id}"]
}

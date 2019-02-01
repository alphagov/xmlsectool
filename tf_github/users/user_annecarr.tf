module "user_annecarr" {
  source = "./verify_user"

  username  = "AnneCarr"
  realname  = "Anne Carr"
  can_merge = "false"

  teams = ["${data.github_team.core.id}"]
}

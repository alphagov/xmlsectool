module "user_annecarr" {
  source = "./verify_user"

  username = "AnneCarr"
  realname = "Anne Carr"

  teams = ["${data.github_team.core.id}"]
}

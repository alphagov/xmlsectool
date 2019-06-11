module "user_ronocg" {
  source = "./verify_user"

  username     = "ronocg"
  realname     = "Conor Glynn"
  can_merge    = "true"

  teams = ["${data.github_team.core.id}"]
}

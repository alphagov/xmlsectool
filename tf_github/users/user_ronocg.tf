module "user_ronocg" {
  source = "./verify_user"

  username = "ronocg"
  realname = "Conor Glynn"

  teams = ["${data.github_team.infrastructure.id}"]
}

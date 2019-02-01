module "user_szd55gds" {
  source = "./verify_user"

  username = "szd55gds"
  realname = "David Pye"

  teams = ["${data.github_team.infrastructure.id}"]
}

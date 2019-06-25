module "user_szd55gds" {
  source = "./verify_user"

  username  = "szd55gds"
  realname  = "David Pye"
  can_merge = "true"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.infrastructure.id}",
  ]
}

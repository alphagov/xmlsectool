module "user_alex_monk" {
  source = "./verify_user"

  username  = "Krenair"
  realname  = "Alex Monk"
  can_merge = "true"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.infrastructure.id}",
  ]
}

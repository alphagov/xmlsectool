module "user_blairboy362" {
  source = "./verify_user"

  username  = "blairboy362"
  realname  = "Daniel Blair"
  can_merge = "true"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.infrastructure.id}",
  ]
}

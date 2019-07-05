module "user_poveyd" {
  source = "./verify_user"

  username  = "poveyd"
  realname  = "David Povey"
  can_merge = "true"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.infrastructure.id}"
  ]
}


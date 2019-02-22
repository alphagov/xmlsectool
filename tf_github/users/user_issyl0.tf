module "user_issyl0" {
  source = "./verify_user"

  username  = "issyl0"
  realname  = "Isabell Long"
  can_merge = "true"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.infrastructure.id}",
  ]
}

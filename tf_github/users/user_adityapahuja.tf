module "user_adityapahuja" {
  source = "./verify_user"

  username  = "adityapahuja"
  realname  = "Aditya Pahuja"
  can_merge = "true"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.infrastructure.id}",
  ]
}

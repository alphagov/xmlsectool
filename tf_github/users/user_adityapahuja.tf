module "user_adityapahuja" {
  source = "./verify_user"

  username = "adityapahuja"
  realname = "Aditya Pahuja"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.infrastructure.id}",
  ]
}

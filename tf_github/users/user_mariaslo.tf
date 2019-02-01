module "user_mariaslo" {
  source = "./verify_user"

  username = "Mariaslo"
  realname = "Maria Lopez Oller"

  teams = ["${data.github_team.core.id}"]
}

module "user_mariaslo" {
  source = "./verify_user"

  username  = "Mariaslo"
  realname  = "Maria Lopez Oller"
  can_merge = "false"

  teams = ["${data.github_team.core.id}"]
}

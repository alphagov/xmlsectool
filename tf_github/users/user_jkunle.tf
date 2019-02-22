module "user_jkunle" {
  source = "./verify_user"

  username  = "jkunle"
  realname  = "Olakunle Jegede"
  can_merge = "false"

  teams = ["${data.github_team.core.id}"]
}

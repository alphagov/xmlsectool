module "user_zilnhoj" {
  source = "./verify_user"

  username  = "zilnhoj"
  realname  = "John Byrne"
  can_merge = "false"

  teams = ["${data.github_team.core.id}"]
}

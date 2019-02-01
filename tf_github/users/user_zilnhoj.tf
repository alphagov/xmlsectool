module "user_zilnhoj" {
  source = "./verify_user"

  username = "zilnhoj"
  realname = "John Byrne"

  teams = ["${data.github_team.core.id}"]
}

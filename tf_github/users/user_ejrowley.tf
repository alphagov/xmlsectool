module "user_ejrowley" {
  source = "./verify_user"

  username = "ejrowley"
  realname = "Ed Rowley"

  teams = ["${data.github_team.infrastructure.id}"]
}

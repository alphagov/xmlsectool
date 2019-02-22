module "user_ejrowley" {
  source = "./verify_user"

  username  = "ejrowley"
  realname  = "Ed Rowley"
  can_merge = "true"

  teams = ["${data.github_team.infrastructure.id}"]
}

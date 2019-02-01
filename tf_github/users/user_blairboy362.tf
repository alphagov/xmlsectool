module "user_blairboy362" {
  source = "./verify_user"

  username = "blairboy362"
  realname = "Daniel Blair"

  teams = ["${data.github_team.infrastructure.id}"]
}

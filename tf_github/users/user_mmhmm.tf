module "user_mmhmm" {
  source = "./verify_user"

  username = "mmhmm"
  realname = "Mark Hynes"

  teams = ["${data.github_team.infrastructure.id}"]
}

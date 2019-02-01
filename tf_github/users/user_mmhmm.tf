module "user_mmhmm" {
  source = "./verify_user"

  username  = "mmhmm"
  realname  = "Mark Hynes"
  can_merge = "true"

  teams = ["${data.github_team.infrastructure.id}"]
}

module "user_smford" {
  source = "./verify_user"

  username  = "smford"
  realname  = "Stephen Ford"
  can_merge = "true"

  teams = ["${data.github_team.infrastructure.id}"]
}

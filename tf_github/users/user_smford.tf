module "user_smford" {
  source = "./verify_user"

  username = "smford"
  realname = "Stephen Ford"

  teams = ["${data.github_team.infrastructure.id}"]
}

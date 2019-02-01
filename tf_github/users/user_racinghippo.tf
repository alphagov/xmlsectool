module "user_racinghippo" {
  source = "./verify_user"

  username = "RacingHippo"
  realname = "John Kennard"

  teams = ["${data.github_team.core.id}"]
}

module "user_racinghippo" {
  source = "./verify_user"

  username  = "RacingHippo"
  realname  = "John Kennard"
  can_merge = "false"

  teams = ["${data.github_team.core.id}"]
}

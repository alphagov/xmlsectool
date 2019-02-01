module "user_ida_build_bot" {
  source = "./verify_user"

  username = "ida-build-bot"
  realname = "BEEP BOOP I'm a robot"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.eidas.id}",
  ]
}

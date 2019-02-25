module "user_idacodacybot" {
  source = "./verify_user"

  username  = "ida-codacy-bot"
  realname  = "GOV.UK Verify Codacy Bot"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.eidas.id}",
  ]
}

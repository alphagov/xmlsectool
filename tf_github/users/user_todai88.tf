module "user_todai88" {
  source = "./verify_user"

  username  = "todai88"
  realname  = "Joakim Bajoul Kakaei"
  can_merge = "false"

  teams = ["${data.github_team.core.id}"]
}

module "user_mhussein_gds" {
  source = "./verify_user"

  username  = "mhussein-gds"
  realname  = "Muhammed Hussein"
  can_merge = "true"

  teams = ["${data.github_team.core.id}"]
}

module "user_rhowe_gds" {
  source = "./verify_user"

  username  = "rhowe-gds"
  realname  = "Russell Howe"
  can_merge = "true"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.infrastructure.id}",
  ]
}

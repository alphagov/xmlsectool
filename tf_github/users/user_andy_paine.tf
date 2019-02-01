module "user_andy_paine" {
  source = "./verify_user"

  username = "andy-paine"
  realname = "Andy Paine"

  teams = [
    "${data.github_team.core.id}",
    "${data.github_team.infrastructure.id}",
  ]
}

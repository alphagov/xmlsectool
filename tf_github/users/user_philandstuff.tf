module "user_philandstuff" {
  source = "./verify_user"

  username = "philandstuff"
  realname = "Philip Potter"
  org_role = "admin"
  teams = [
            "${data.github_team.core.id}",
            "${data.github_team.infrastructure.id}"
          ]
}
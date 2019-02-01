module "user_sakisv" {
  source = "./verify_user"

  username = "sakisv"
  realname = "Athanasios Voutsadakis"

  teams = ["${data.github_team.infrastructure.id}"]
}

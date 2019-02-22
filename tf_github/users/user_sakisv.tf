module "user_sakisv" {
  source = "./verify_user"

  username  = "sakisv"
  realname  = "Athanasios Voutsadakis"
  can_merge = "true"

  teams = ["${data.github_team.infrastructure.id}"]
}

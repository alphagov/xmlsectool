module "user_mariaslo" {
  source = "./verify_user"

  username = "mariaslo"
  realname = "Maria Lopez Oller"
  org_role = "member"
  teams = [ "verify-tech-team-performance-pa" ]
}

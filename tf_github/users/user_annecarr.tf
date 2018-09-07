module "user_annecarr" {
  source = "./verify_user"

  username = "annecarr"
  realname = "Anne Carr"
  org_role = "member"
  teams = [ "verify-tech-team-performance-pa" ]
}

module "user_dbes_gds" {
  source = "./verify_user"

  username = "dbes-gds"
  org_role = "member"
  teams = {
      }
}

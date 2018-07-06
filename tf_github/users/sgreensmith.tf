module "user_sgreensmith" {
  source = "./verify_user"

  username = "sgreensmith"
  org_role = "member"
  teams = {
      }
}

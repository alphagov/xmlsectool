module "user_phantas" {
  source = "./verify_user"

  username = "phantas"
  org_role = "member"
  teams = {
      }
}

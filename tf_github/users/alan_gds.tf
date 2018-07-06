module "user_alan_gds" {
  source = "./verify_user"

  username = "alan-gds"
  org_role = "member"
  teams = {
      }
}

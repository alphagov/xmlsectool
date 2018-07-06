module "user_rhowe_gds" {
  source = "./verify_user"

  username = "rhowe-gds"
  org_role = "admin"
  teams = {
      }
}

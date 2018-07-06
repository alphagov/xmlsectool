module "user_smford" {
  source = "./verify_user"

  username = "smford"
  org_role = "admin"
  teams = {
      }
}

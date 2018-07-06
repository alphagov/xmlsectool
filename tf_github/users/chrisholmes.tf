module "user_chrisholmes" {
  source = "./verify_user"

  username = "chrisholmes"
  org_role = "admin"
  teams = {
      }
}

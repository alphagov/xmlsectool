module "user_anshulsirur" {
  source = "./verify_user"

  username = "vixus0"
  org_role = "admin"
  teams = {
    "team-verify-terraform-test" = "maintainer"
  }
}

module "user_andypaine" {
  source = "./verify_user"

  username = "andy-paine"
  teams = {
    "team-verify-terraform-test" = "member"
  }
}

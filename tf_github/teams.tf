module "verify_test_team" {
  source = "./verify_team"

  name        = "team-verify-terraform-test"
  description = "Testing Verify terraform"
  privacy     = "secret"
  maintainers = [ "vixus0" ]
  members     = [ "andy-paine" ]
}

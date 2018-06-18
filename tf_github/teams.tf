resource "github_team" "verify_test_team" {
  name        = "team-verify-terraform-test"
  description = "Testing Verify terraform"
  privacy     = "secret"
}

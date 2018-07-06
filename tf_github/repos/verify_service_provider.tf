module "repo_verify_service_provider" {
  source = "./verify_repo"

  name = "verify-service-provider"
  description = ":crown: :ballot_box_with_check: The easiest way to connect to GOV.UK Verify"
  private = "false"
  push_teams = [
        "verify-tech-team-connecting",
      ]
}

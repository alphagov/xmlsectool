module "repo_verify_idp_predictor" {
  source = "./verify_repo"

  name = "verify-idp-predictor"
  description = "The IDP Predictor for GOV.UK Verify."
  private = "true"
  push_teams = [
        "verify-tech-team-performance-pa",
        "verify-tech-team-performance-dev",
      ]
}
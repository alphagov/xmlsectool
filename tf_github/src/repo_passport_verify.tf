module "repo_passport_verify" {
  source = "./verify_repo"

  name = "passport-verify"
  description = ":passport_control: :crown: :ballot_box_with_check: A passport.js strategy for GOV.UK Verify"
  private = "false"
  push_teams = [
        "verify-tech-team-connecting",
      ]
}

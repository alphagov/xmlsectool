module "repo_verify_blackbox_passwords" {
  source = "./verify_repo"

  name = "verify-blackbox-passwords"
  description = "Securely stored credentials for Verify"
  private = "true"
  allow_push_to_master = "true"
  push_teams = [
        "verify-tech-team-core",
        "verify-tech-team-infrastructure",
      ]
}

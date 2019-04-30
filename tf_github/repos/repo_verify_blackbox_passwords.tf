module "repo_verify_blackbox_passwords" {
  source = "./verify_repo"

  name = "verify-blackbox-passwords"
  description = "Securely stored credentials for Verify"
  private = "true"
  allow_push_to_master = "true"
  push_teams = [
        "${data.github_team.core.id}",
        "${data.github_team.infrastructure.id}",
      ]
}

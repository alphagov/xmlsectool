module "repo_verify_audit_app_config" {
  source = "./verify_repo"

  name = "verify-audit-app-config"
  description = "Application config for Audit app"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

module "repo_verify_billing_app_config" {
  source = "./verify_repo"

  name = "verify-billing-app-config"
  description = "Billing application config"
  private = "true"
  archived = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

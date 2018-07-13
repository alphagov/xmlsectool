module "repo_verify_saml_engine_app_config" {
  source = "./verify_repo"

  name = "verify-saml-engine-app-config"
  description = "Saml Engine's application config"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

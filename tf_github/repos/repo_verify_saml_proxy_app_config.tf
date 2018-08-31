module "repo_verify_saml_proxy_app_config" {
  source = "./verify_repo"

  name = "verify-saml-proxy-app-config"
  description = "Configuration for Verify saml-proxy service"
  private = "true"
  archived = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

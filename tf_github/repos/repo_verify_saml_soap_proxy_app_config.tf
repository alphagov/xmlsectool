module "repo_verify_saml_soap_proxy_app_config" {
  source = "./verify_repo"

  name = "verify-saml-soap-proxy-app-config"
  description = "Configuration for Verify saml-soap-proxy service"
  private = "true"
  archived = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

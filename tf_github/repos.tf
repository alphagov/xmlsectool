module "repo_verify_hub" {
  source = "./verify_repo"

  name = "verify-hub"
  description = "Verify Hub Microservices"
  private = "false"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

module "repo_verify_saml_libs" {
  source = "./verify_repo"

  name = "verify-saml-libs"
  description = "Verify SAML Libraries 📚"
  private = "false"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

module "repo_ida_hub_support" {
  source = "./verify_repo"

  name = "ida-hub-support"
  description = "Verify Hub Support services (temporary)"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

module "repo_verify_token_service" {
  source = "./verify_repo"

  name = "verify-token-service"
  description = "Verify Token Service"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

module "repo_verify_test_rp" {
  source = "./verify_repo"

  name = "verify-test-rp"
  description = "Verify Test Relying Party"
  private = "false"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

module "repo_verify_stub_idp" {
  source = "./verify_repo"

  name = "verify-stub-idp"
  description = "Stub Identity Provider and Stub eIDAS Proxy Service Node used for testing GOV.UK Verify"
  private = "false"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

module "repo_verify_eidas_trust_anchor" {
  source = "./verify_repo"

  name = "verify-eidas-trust-anchor"
  description = "Generates trust anchors as JSON Web Keys that allow MSAs and Hubs to validate European metadata."
  private = "false"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

module "repo_verify_eidas_metadata_aggregator" {
  source = "./verify_repo"

  name = "verify-eidas-metadata-aggregator"
  description = "Script to aggregate metadata from EU countries"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

module "repo_verify_utils_libs" {
  source = "./verify_repo"

  name = "verify-utils-libs"
  description = "Libraries used across multiple Verify projects"
  private = "false"
  push_teams = [
        "verify-tech-team-core-hub",
        "verify-tech-team-dcs",
      ]
}

module "repo_verify_hub_federation_config" {
  source = "./verify_repo"

  name = "verify-hub-federation-config"
  description = "Verify Hub federation configuration"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
        "verify-tech-team-connecting",
      ]
}

module "repo_verify_metadata" {
  source = "./verify_repo"

  name = "verify-metadata"
  description = "Verify SAML metadata sources"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
        "verify-tech-team-connecting",
      ]
}

module "repo_verify_config_app_config" {
  source = "./verify_repo"

  name = "verify-config-app-config"
  description = "Repo for Verify Config services application config"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

module "repo_verify_policy_app_config" {
  source = "./verify_repo"

  name = "verify-policy-app-config"
  description = "Application config for Policy app"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

module "repo_verify_saml_engine_app_config" {
  source = "./verify_repo"

  name = "verify-saml-engine-app-config"
  description = "Saml Engine's application config"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

module "repo_verify_event_sink_app_config" {
  source = "./verify_repo"

  name = "verify-event-sink-app-config"
  description = "App config for Event-Sink app"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

module "repo_verify_audit_app_config" {
  source = "./verify_repo"

  name = "verify-audit-app-config"
  description = "Application config for Audit app"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

module "repo_verify_billing_app_config" {
  source = "./verify_repo"

  name = "verify-billing-app-config"
  description = "Billing application config"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

module "repo_verify_token_service_app_config" {
  source = "./verify_repo"

  name = "verify-token-service-app-config"
  description = "Token Service app config"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

module "repo_verify_saml_proxy_app_config" {
  source = "./verify_repo"

  name = "verify-saml-proxy-app-config"
  description = "Configuration for Verify saml-proxy service"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

module "repo_verify_saml_soap_proxy_app_config" {
  source = "./verify_repo"

  name = "verify-saml-soap-proxy-app-config"
  description = "Configuration for Verify saml-soap-proxy service"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

module "repo_doc_checking" {
  source = "./verify_repo"

  name = "doc-checking"
  description = "Verify Document Checking Service"
  private = "true"
  push_teams = [
        "verify-tech-team-dcs",
      ]
}

module "repo_dcs_client" {
  source = "./verify_repo"

  name = "dcs-client"
  description = "A client for the Document Checking Service"
  private = "false"
  push_teams = [
        "verify-tech-team-dcs",
      ]
}

module "repo_dcs_performance_tests" {
  source = "./verify_repo"

  name = "dcs-performance-tests"
  description = "Verify DCS Performance Tests"
  private = "true"
  push_teams = [
        "verify-tech-team-dcs",
      ]
}

module "repo_dcs_client_acceptance_tests" {
  source = "./verify_repo"

  name = "dcs-client-acceptance-tests"
  description = "Acceptance tests for the DCS client - https://github.com/alphagov/dcs-client"
  private = "true"
  push_teams = [
        "verify-tech-team-dcs",
      ]
}

module "repo_verify_matching_service_adapter" {
  source = "./verify_repo"

  name = "verify-matching-service-adapter"
  description = "Verify Matching Service Adapter"
  private = "false"
  push_teams = [
        "verify-tech-team-connecting",
      ]
}

module "repo_verify_service_provider" {
  source = "./verify_repo"

  name = "verify-service-provider"
  description = ":crown: :ballot_box_with_check: The easiest way to connect to GOV.UK Verify"
  private = "false"
  push_teams = [
        "verify-tech-team-connecting",
      ]
}

module "repo_verify_support_form" {
  source = "./verify_repo"

  name = "verify-support-form"
  description = "Verify support form"
  private = "false"
  push_teams = [
        "verify-tech-team-connecting",
      ]
}

module "repo_verify_rp_environment_config_form" {
  source = "./verify_repo"

  name = "verify-rp-environment-config-form"
  description = " :page_with_curl: The form for relying parties to provide Verify with environment configuration"
  private = "false"
  push_teams = [
        "verify-tech-team-connecting",
      ]
}

module "repo_passport_verify" {
  source = "./verify_repo"

  name = "passport-verify"
  description = ":passport_control: :crown: :ballot_box_with_check: A passport.js strategy for GOV.UK Verify"
  private = "false"
  push_teams = [
        "verify-tech-team-connecting",
      ]
}

module "repo_passport_verify_stub_relying_party" {
  source = "./verify_repo"

  name = "passport-verify-stub-relying-party"
  description = "Stub Relying party that integrates with Verify using the passport-verify library"
  private = "false"
  push_teams = [
        "verify-tech-team-connecting",
      ]
}

module "repo_verify_local_matching_service_example" {
  source = "./verify_repo"

  name = "verify-local-matching-service-example"
  description = ""
  private = "false"
  push_teams = [
        "verify-tech-team-connecting",
      ]
}

module "repo_verify_puppet" {
  source = "./verify_repo"

  name = "verify-puppet"
  description = "Puppet code for GOV.UK Verify"
  private = "true"
  push_teams = [
        "verify-tech-team-infrastructure",
      ]
}

module "repo_verify_terraform" {
  source = "./verify_repo"

  name = "verify-terraform"
  description = "Terraform code for GOV.UK Verify infrastructure"
  private = "true"
  push_teams = [
        "verify-tech-team-infrastructure",
      ]
}

module "repo_verify_fabric" {
  source = "./verify_repo"

  name = "verify-fabric"
  description = " Fabric for Verify "
  private = "true"
  push_teams = [
        "verify-tech-team-infrastructure",
      ]
}

module "repo_verify_ansible" {
  source = "./verify_repo"

  name = "verify-ansible"
  description = " Ansible for Verify ops "
  private = "true"
  push_teams = [
        "verify-tech-team-infrastructure",
      ]
}

module "repo_verify_boxes" {
  source = "./verify_repo"

  name = "verify-boxes"
  description = "Verify specific configuration for vcloud-launch "
  private = "true"
  push_teams = [
        "verify-tech-team-infrastructure",
      ]
}

module "repo_verify_eidas_notification" {
  source = "./verify_repo"

  name = "verify-eidas-notification"
  description = "eIDAS Notification"
  private = "false"
  push_teams = [
        "verify-tech-team-eidas-notification",
      ]
}

module "repo_verify_eidas_governikus_middleware" {
  source = "./verify_repo"

  name = "verify-eidas-governikus-middleware"
  description = ""
  private = "true"
  push_teams = [
        "verify-tech-team-eidas-middleware",
      ]
}

module "repo_verify_eidas_middleware" {
  source = "./verify_repo"

  name = "verify-eidas-middleware"
  description = "Verify eIDAS Middleware Repo"
  private = "true"
  push_teams = [
        "verify-tech-team-eidas-middleware",
      ]
}

module "repo_verify_german_eidas_middleware" {
  source = "./verify_repo"

  name = "verify-german-eidas-middleware"
  description = ""
  private = "false"
  push_teams = [
        "verify-tech-team-eidas-middleware",
      ]
}

module "repo_verify_frontend" {
  source = "./verify_repo"

  name = "verify-frontend"
  description = "The frontend service for GOV.UK Verify"
  private = "false"
  push_teams = [
        "verify-tech-team-frontend",
      ]
}

module "repo_verify_frontend_app_config" {
  source = "./verify_repo"

  name = "verify-frontend-app-config"
  description = "App config for the Verify Rails frontend"
  private = "true"
  push_teams = [
        "verify-tech-team-frontend",
      ]
}

module "repo_verify_frontend_federation_config" {
  source = "./verify_repo"

  name = "verify-frontend-federation-config"
  description = "Federation configuration for the Verify frontend"
  private = "true"
  push_teams = [
        "verify-tech-team-frontend",
      ]
}

module "repo_verify_team_manual" {
  source = "./verify_repo"

  name = "verify-team-manual"
  description = ""
  private = "true"
  push_teams = [
        "verify-tech-team-tools",
      ]
}

module "repo_verify_jenkins_job_builder" {
  source = "./verify_repo"

  name = "verify-jenkins-job-builder"
  description = "Verify Jenkins Job Builder configuration"
  private = "true"
  push_teams = [
        "verify-tech-team-tools",
      ]
}

module "repo_verify_tech_team" {
  source = "./verify_repo"

  name = "verify-tech-team"
  description = "Data about Verify team members"
  private = "true"
  push_teams = [
        "verify-tech-team-tools",
      ]
}

module "repo_verify_release_automation" {
  source = "./verify_repo"

  name = "verify-release-automation"
  description = "🚂 The Verify Release Train"
  private = "true"
  push_teams = [
        "verify-tech-team-tools",
      ]
}


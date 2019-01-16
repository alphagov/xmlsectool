module "repo_verify_hub_federation_config" {
  source = "./verify_repo"

  name = "verify-hub-federation-config"
  description = "Verify Hub federation configuration"
  private = "true"
  push_teams = [
        "verify-tech-team-core",
      ]
}

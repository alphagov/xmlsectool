module "repo_verify_eidas_trust_anchor" {
  source = "./verify_repo"

  name = "verify-eidas-trust-anchor"
  description = "Generates trust anchors as JSON Web Keys that allow MSAs and Hubs to validate European metadata."
  private = "false"
  push_teams = [
        "verify-tech-team-eidas",
      ]
}

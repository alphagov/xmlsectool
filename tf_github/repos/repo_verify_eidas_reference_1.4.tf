module "repo_verify_eidas_reference_1.4" {
  source = "./verify_repo"

  name = "verify-eidas-reference-1.4"
  description = ""
  private = "false"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

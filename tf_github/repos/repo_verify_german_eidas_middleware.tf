module "repo_verify_german_eidas_middleware" {
  source = "./verify_repo"

  name = "verify-german-eidas-middleware"
  description = ""
  private = "false"
  push_teams = [
        "verify-tech-team-eidas",
      ]
}

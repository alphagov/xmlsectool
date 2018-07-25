module "repo_verify_eidas_middleware" {
  source = "./verify_repo"

  name = "verify-eidas-middleware"
  description = "Verify eIDAS Middleware Repo"
  private = "true"
  archived = "true"
  push_teams = [
        "verify-tech-team-eidas-middleware",
      ]
}

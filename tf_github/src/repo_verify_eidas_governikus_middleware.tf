module "repo_verify_eidas_governikus_middleware" {
  source = "./verify_repo"

  name = "verify-eidas-governikus-middleware"
  description = ""
  private = "true"
  push_teams = [
        "verify-tech-team-eidas-middleware",
      ]
}

module "repo_verify_il3_laptop_bootstrap" {
  source = "./verify_repo"

  name = "verify-il3-laptop-bootstrap"
  description = "A simple set of shell scripts to set up a secure build laptop for Verify"
  private = "true"
  push_teams = [
        "verify-tech-team-infrastructure",
  ]
}

module "repo_verify_terraform" {
  source = "./verify_repo"

  name = "verify-terraform"
  description = "Terraform code for GOV.UK Verify infrastructure"
  private = "true"
  push_teams = [
        "verify-tech-team-infrastructure",
      ]
}
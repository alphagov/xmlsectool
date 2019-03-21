module "verify-self-service-infrastructure" {
  source = "./verify_repo"

  name = "verify-self-service-infrastructure"
  description = "Infrastructure and terraform files for Verify Self Service"
  private = "true"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

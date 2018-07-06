module "repo_ida_hub_support" {
  source = "./verify_repo"

  name = "ida-hub-support"
  description = "Verify Hub Support services (temporary)"
  private = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

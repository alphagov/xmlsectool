module "teams" {
  source = "./verify_teams"

  teams = [
    "verify-tech-team-core",
    "verify-tech-team-eidas",
    "verify-tech-team-infrastructure",
    "verify-tech-team-approvers",
  ]
}

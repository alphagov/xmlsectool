module "mission_optimising" {
  source = "./verify_mission"
  teams = [
    "verify-tech-team-core-hub",
    "verify-tech-team-frontend",
    "verify-tech-team-infrastructure",
    "verify-tech-team-tools",
  ]
}

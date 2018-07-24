module "mission_eidas" {
  source = "./verify_mission"
  teams = [
    "verify-tech-team-core-hub",
    "verify-tech-team-eidas-notification",
    "verify-tech-team-eidas-middleware",
    "verify-tech-team-dcs",
    "verify-tech-team-frontend",
    "verify-tech-team-infrastructure",
    "verify-tech-team-tools",
  ]
}

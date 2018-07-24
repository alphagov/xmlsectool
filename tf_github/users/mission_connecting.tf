module "mission_connecting" {
  source = "./verify_mission"
  teams = [
    "verify-tech-team-core-hub",
    "verify-tech-team-connecting",
    "verify-tech-team-dcs",
    "verify-tech-team-frontend",
    "verify-tech-team-infrastructure",
    "verify-tech-team-tools",
  ]
}

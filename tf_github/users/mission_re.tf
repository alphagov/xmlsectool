module "mission_re" {
  source = "./verify_mission"
  teams = [
    "verify-tech-team-connecting",
    "verify-tech-team-dcs",
    "verify-tech-team-eidas-middleware",
    "verify-tech-team-infrastructure",
    "verify-tech-team-tools",
    "verify-tech-team-core-hub",
  ]
}

module "mission_re" {
  source = "./verify_mission"
  teams = [
    "verify-tech-team-connecting",
    "verify-tech-team-dcs",
    "verify-tech-team-infrastructure",
    "verify-tech-team-tools",
  ]
}
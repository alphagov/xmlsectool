module "mission_secops" {
  source = "./verify_mission"
  teams = [
    "verify-tech-team-infrastructure",
  ]
}

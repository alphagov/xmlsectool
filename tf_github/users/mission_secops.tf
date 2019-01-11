module "mission_secops" {
  source = "./verify_mission"
  teams = [
    "${data.github_team.infrastructure.id}",
  ]
}

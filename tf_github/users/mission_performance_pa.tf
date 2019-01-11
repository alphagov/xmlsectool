module "mission_performance_pa" {
  source = "./verify_mission"
  teams = [
    "${data.github_team.performance_pa.id}",
  ]
}

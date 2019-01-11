module "mission_performance" {
  source = "./verify_mission"
  teams = [
    "${data.github_team.core_hub.id}",
    "${data.github_team.connecting.id}",
    "${data.github_team.dcs.id}",
    "${data.github_team.frontend.id}",
    "${data.github_team.infrastructure.id}",
    "${data.github_team.performance_dev.id}",
    "${data.github_team.tools.id}",
  ]
}

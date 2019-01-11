module "mission_re" {
  source = "./verify_mission"
  teams = [
    "${data.github_team.connecting.id}",
    "${data.github_team.dcs.id}",
    "${data.github_team.eidas_middleware.id}",
    "${data.github_team.infrastructure.id}",
    "${data.github_team.tools.id}",
    "${data.github_team.core_hub.id}",
  ]
}

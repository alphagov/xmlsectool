module "mission_optimising" {
  source = "./verify_mission"
  teams = [
    "${data.github_team.core_hub.id}",
    "${data.github_team.frontend.id}",
    "${data.github_team.infrastructure.id}",
    "${data.github_team.tools.id}",
  ]
}

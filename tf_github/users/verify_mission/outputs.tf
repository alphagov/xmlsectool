output "teams" {
  value = "${data.github_team.teams.*.id}"
}

resource "github_team" "team" {
  count = "${length(var.teams)}"
  name = "${element(var.teams, count.index)}"
  description = "Verify tech team: ${element(var.teams, count.index)}" 
  privacy = "closed"
}

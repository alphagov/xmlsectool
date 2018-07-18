resource "github_team" "parent_team" {
  name = "verify-tech-team"
  description = "Verify Tech Team"
  privacy = "closed"
}

resource "github_team" "team" {
  count = "${length(var.teams)}"
  name = "${element(var.teams, count.index)}"
  description = "Verify tech team: ${element(var.teams, count.index)}" 
  privacy = "closed"
  parent_team_id = "${github_team.parent_team.id}"
}

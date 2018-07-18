data "github_team" "teams" {
  count = "${length(var.teams)}"
  slug = "${element(var.teams, count.index)}"
}

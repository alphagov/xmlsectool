data "github_user" "user" {
  username = "${var.username}"
}

data "github_team" "teams" {
  count = "${length(var.teams)}"
  slug = "${element(var.teams, count.index)}"
}

resource "github_membership" "org_membership" {
  username = "${var.username}"
  role = "${var.org_role}"
}

resource "github_team_membership" "team_membership" {
  count = "${length(var.teams)}"

  team_id = "${element(data.github_team.teams.*.id, count.index)}"
  username = "${var.username}"
  role = "member"
}

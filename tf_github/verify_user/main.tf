data "github_user" "user" {
  username = "${var.username}"
}

data "github_team" "teams" {
  count = "${length(keys(var.teams))}"
  slug = "${element(keys(var.teams), count.index)}"
}

resource "github_membership" "org_membership" {
  username = "${var.username}"
  role = "${var.org_role}"
}

resource "github_team_membership" "team_membership" {
  count = "${length(keys(var.teams))}"

  team_id = "${element(data.github_team.teams.*.id, count.index)}"
  username = "${var.username}"
  role = "${lookup(var.teams, element(keys(var.teams), count.index))}"
}

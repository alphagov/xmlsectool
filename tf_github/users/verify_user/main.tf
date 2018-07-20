data "github_user" "user" {
  username = "${var.username}"
}

resource "github_membership" "org_membership" {
  username = "${var.username}"
  role = "${var.org_role}"
}

resource "github_team_membership" "team_membership" {
  count = "${length(var.teams)}"

  team_id = "${element(var.teams, count.index)}"
  username = "${var.username}"
  role = "${var.org_role == "admin" ? "maintainer" : "member"}"
}

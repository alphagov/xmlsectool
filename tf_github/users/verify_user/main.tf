resource "github_team_membership" "team_membership" {
  count = "${length(var.teams)}"

  team_id  = "${element(var.teams, count.index)}"
  username = "${var.username}"
  role     = "${var.verify_admin ? "maintainer" : "member"}"
}

data "github_team" "tech_team" {
  slug = "verify-tech-team"
}

resource "github_team_membership" "tech_team_maintainer" {
  count = "${var.verify_admin == "true" ? 1 : 0}"

  team_id  = "${data.github_team.tech_team.id}"
  username = "${var.username}"
  role     = "maintainer"
}

data "github_team" "approvers_team" {
  slug = "verify-tech-team-approvers"
}

resource "github_team_membership" "tech_team_approver" {
  count = "${var.can_merge == "true" ? 1 : 0}"

  team_id  = "${data.github_team.approvers_team.id}"
  username = "${var.username}"
  role     = "member"
}

resource "github_team" "team" {
  name = "${var.name}"
  description = "${var.description}"
  privacy = "${var.privacy}"
}

data "github_user" "team_members" {
  count = "${length(var.members)}"
  username = "${element(var.members, count.index)}"  
}

resource "github_team_membership" "team_member" {
  count = "${length(var.members)}"

  username = "${element(var.members, count.index)}" 
  team_id = "${github_team.team.id}"
  role = "member"
}

data "github_user" "team_maintainers" {
  count = "${length(var.maintainers)}"
  username = "${element(var.maintainers, count.index)}"  
}

resource "github_team_membership" "team_maintainer" {
  count = "${length(var.maintainers)}"

  username = "${element(var.maintainers, count.index)}" 
  team_id = "${github_team.team.id}"
  role = "maintainer"
}


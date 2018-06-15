resource "github_repository" "repo" {
  name = "${var.name}"
  description = "${var.description}"
  private = "${var.private}"
  auto_init = true
  license_template = "mit"

  allow_rebase_merge = false
  allow_squash_merge = false
}

data "github_user" "master_users" {
  count = "${length(var.master_users)}"
  username = "${element(var.master_users, count.index)}"
}

data "github_team" "push_teams" {
  count = "${var.push_team_count}"
  slug = "${element(var.push_teams, count.index)}"
}

data "github_team" "read_teams" {
  count = "${var.read_team_count}"
  slug = "${element(var.read_teams, count.index)}"
}

resource "github_team_repository" "repo_team_push" {
  count = "${var.push_team_count}"

  team_id = "${element(data.github_team.push_teams.*.id, count.index)}"
  repository = "${github_repository.repo.name}"
  permission = "push"
}

resource "github_team_repository" "repo_team_read" {
  count = "${var.read_team_count}"

  team_id = "${element(data.github_team.read_teams.*.id, count.index)}"
  repository = "${github_repository.repo.name}"
  permission = "push"
}

resource "github_branch_protection" "repo_protect_master" {
  repository = "${github_repository.repo.name}"
  branch = "master"
  enforce_admins = false

  restrictions {
    users = "${var.master_users}"
    teams = []
  }

  required_pull_request_reviews {
    dismiss_stale_reviews = true
    require_code_owner_reviews = true
  }
}

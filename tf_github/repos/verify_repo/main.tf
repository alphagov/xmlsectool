resource "github_repository" "repo" {
  name = "${var.name}"
  description = "${var.description}"
  private = "${var.private}"
  archived = "${var.archived}"
  auto_init = "true"

  has_wiki = true
  has_issues = true
  allow_rebase_merge = false
  allow_squash_merge = false

  lifecycle {
    ignore_changes = ["topics", "auto_init"]
  }
}

resource "github_team_repository" "repo_team_push" {
  count = "${length(var.push_teams)}"

  team_id = "${element(var.push_teams, count.index)}"
  repository = "${github_repository.repo.name}"
  permission = "${var.archived == "true" ? "pull" : "push"}"
}

resource "github_team_repository" "repo_team_pull" {
  count = "${length(var.read_teams)}"

  team_id = "${element(var.read_teams, count.index)}"
  repository = "${github_repository.repo.name}"
  permission = "pull"
}

resource "github_branch_protection" "repo_protect_master" {
  count = "${var.allow_push_to_master ? 0 : 1}"

  repository = "${github_repository.repo.name}"
  branch = "master"
  enforce_admins = false

  required_status_checks {
    strict = "${var.strict_status_check}"
  }

  required_pull_request_reviews {
    dismiss_stale_reviews = true
    required_approving_review_count = 2
    require_code_owner_reviews = false
  }
}

resource "github_repository_collaborator" "repo_collaborator_pull" {
  count      = "${length(var.read_collaborators)}"

  username   = "${element(var.read_collaborators, count.index)}"
  repository = "${github_repository.repo.name}"
  permission = "pull"
}

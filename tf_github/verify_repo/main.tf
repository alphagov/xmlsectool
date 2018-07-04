data "github_team" "teams" {
  count = "${length(var.push_teams)}"
  slug = "${element(var.push_teams, count.index)}"
}

resource "github_repository" "repo" {
  name = "${var.name}"
  description = "${var.description}"
  private = "${var.private}"
  auto_init = true
  license_template = "mit"

  allow_rebase_merge = false
  allow_squash_merge = false
}

resource "null_resource" "provision" {
  provisioner "local-exec" {
    command = "./provision.rb ${github_repository.repo.full_name}"
  }
}

resource "github_team_repository" "repo_team_push" {
  count = "${length(var.push_teams)}"

  team_id = "${element(data.github_team.teams.*.id, count.index)}"
  repository = "${github_repository.repo.name}"
  permission = "push"
}

resource "github_team_repository" "repo_team_read" {
  count = "${length(var.pull_teams)}"

  team_id = "${element(var.pull_teams, count.index)}"
  repository = "${github_repository.repo.name}"
  permission = "pull"
}

resource "github_branch_protection" "repo_protect_master" {
  repository = "${github_repository.repo.name}"
  branch = "master"
  enforce_admins = false

  required_pull_request_reviews {
    dismiss_stale_reviews = true
  }
}

module "repo_verify_release_automation" {
  source = "./verify_repo"

  name = "verify-release-automation"
  description = "🚂 The Verify Release Train"
  private = "true"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

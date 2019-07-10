module "repo_verify_release_notes_generator" {
  source = "./verify_repo"

  name = "verify-release-notes-generator"
  description = "Verify Release Notes Generator"
  private = "true"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

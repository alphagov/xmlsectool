module "repo_ida_hub_support" {
  source = "./verify_repo"

  name = "ida-hub-support"
  description = "Verify Hub Support services (temporary)"
  archived = "true"
  private = "true"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

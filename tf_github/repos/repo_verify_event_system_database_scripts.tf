module "repo_verify_event_system_database_scripts" {
  source = "./verify_repo"

  name        = "verify-event-system-database-scripts"
  description = "SQL scripts and schemas for the Event System database"
  private     = "true"

  push_teams = [
    "${data.github_team.core.id}",
  ]

  read_collaborators = ["verify-cd-read-only"]
}

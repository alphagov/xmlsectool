module "repo_verify_event_emitter" {
  source = "./verify_repo"

  name = "verify-event-emitter"
  description = "Send events"
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

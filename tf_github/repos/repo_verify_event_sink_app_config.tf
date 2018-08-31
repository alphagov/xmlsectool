module "repo_verify_event_sink_app_config" {
  source = "./verify_repo"

  name = "verify-event-sink-app-config"
  description = "App config for Event-Sink app"
  private = "true"
  archived = "true"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}

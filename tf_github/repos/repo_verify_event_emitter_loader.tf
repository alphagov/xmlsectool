module "repo_verify_event_emitter_loader" {
  source = "./verify_repo"

  name = "verify-event-emitter-loader"
  description = "Create encrypted events in a given queue"
  private = "false"
  push_teams = [
        "verify-tech-team-core",
      ]
}

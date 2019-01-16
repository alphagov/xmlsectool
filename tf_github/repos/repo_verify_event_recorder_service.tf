module "repo_verify_event_recorder_service" {
  source = "./verify_repo"

  name = "verify-event-recorder-service"
  description = "This service is part of Verify's event recording system; its purpose is to read events from a queue and write them to a permanent datastore."
  private = "false"
  push_teams = [
        "verify-tech-team-core",
      ]
}

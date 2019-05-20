module "repo_verify_event_system_alarm_notifier" {
  source = "./verify_repo"

  name = "verify-event-system-alarm-notifier"
  description = "Lambda functions for monitoring alarm notifications"
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

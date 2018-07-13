module "repo_verify_eidas_notification" {
  source = "./verify_repo"

  name = "verify-eidas-notification"
  description = "eIDAS Notification"
  private = "false"
  push_teams = [
        "verify-tech-team-eidas-notification",
      ]
}

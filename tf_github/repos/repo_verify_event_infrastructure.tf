module "repo_verify_event_infrastructure" {
  source = "./verify_repo"

  name        = "verify-event-infrastructure"
  description = "Infrastructure used to process Audit & Billing events for Verify"
  private     = "true"

  strict_status_check = true

  push_teams = [
    "${data.github_team.core.id}",
    "${data.github_team.infrastructure.id}",
  ]

  read_collaborators = ["verify-cd-read-only"]
}

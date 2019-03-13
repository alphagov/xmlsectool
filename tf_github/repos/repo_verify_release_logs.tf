module "repo_verify_release_logs" {
  source = "./verify_repo"

  name = "verify-release-logs"
  description = "Logs of releases generated from the verify-release-automation tool"
  private = "true"
  push_teams = [
        "verify-tech-team-core",
      ]
}
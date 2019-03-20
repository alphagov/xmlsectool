module "repo_verify_matching_service_adapter" {
  source = "./verify_repo"

  name = "verify-matching-service-adapter"
  description = "Verify Matching Service Adapter"
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

module "repo_verify_local_matching_service_example" {
  source = "./verify_repo"

  name = "verify-local-matching-service-example"
  description = ""
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

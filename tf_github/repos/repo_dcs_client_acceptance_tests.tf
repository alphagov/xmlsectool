module "repo_dcs_client_acceptance_tests" {
  source = "./verify_repo"

  name = "dcs-client-acceptance-tests"
  description = "Acceptance tests for the DCS client - https://github.com/alphagov/dcs-client"
  private = "true"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

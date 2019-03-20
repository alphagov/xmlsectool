module "repo_verify_datascience_sandbox" {
  source = "./verify_repo"

  name = "verify-datascience-sandbox"
  description = "A repository for analysis of GOV.UK Verify data."
  private = "true"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}
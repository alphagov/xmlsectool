module "repo_dcs_client" {
  source = "./verify_repo"

  name = "dcs-client"
  description = "A client for the Document Checking Service"
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

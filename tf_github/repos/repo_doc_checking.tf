module "repo_doc_checking" {
  source = "./verify_repo"

  name = "doc-checking"
  description = "Verify Document Checking Service"
  private = "true"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

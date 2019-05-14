module "repo_repo_splunk_library_javalogging" {
  source = "./verify_repo"

  name = "splunk-library-javalogging"
  description = ""
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

module "repo_verify_local_startup" {
  source = "./verify_repo"

  name = "verify-local-startup"
  description = "Utilities to run the Verify Hub and stubs locally"
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

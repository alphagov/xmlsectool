module "repo_verify_build_scripts" {
  source = "./verify_repo"

  name = "verify-build-scripts"
  description = "Useful scripts and tools for Verify tech"
  private = "true"
  push_teams = [
        "verify-tech-team-tools",
      ]
}


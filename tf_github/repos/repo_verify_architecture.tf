module "repo_verify_architecture" {
  source = "./verify_repo"

  name = "verify-architecture"
  description = "Contains architectural documentation"
  private = "true"
  push_teams = [
        "verify-tech-team-core",
      ]
}

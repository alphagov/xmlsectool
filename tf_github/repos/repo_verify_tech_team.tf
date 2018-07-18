module "repo_verify_tech_team" {
  source = "./verify_repo"

  name = "verify-tech-team"
  description = "Data about Verify team members"
  private = "true"
  push_teams = [
        "verify-tech-team-tools",
      ]
}

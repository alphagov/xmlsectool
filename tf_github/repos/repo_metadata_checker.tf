module "repo_metadata_checker" {
  source = "./verify_repo"

  name        = "metadata-checker"
  description = "Tools for parsing and monitoring SAML metadata"
  private     = "false"

  push_teams = [
    "${data.github_team.core.id}",
    "${data.github_team.infrastructure.id}",
  ]
}

module "repo_verify_saml_libs" {
  source = "./verify_repo"

  name = "verify-saml-libs"
  description = "Verify SAML Libraries 📚"
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

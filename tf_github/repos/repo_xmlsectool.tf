module "repo_xmlsectool" {
  source = "./verify_repo"

  name = "xmlsectool"
  description = "Fork of shibboleths xmlsectool modified for Java 11"
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

module "repo_ida_compliance_tool" {
  source = "./verify_repo"

  name = "ida-compliance-tool"
  description = "Verify Compliance Tool (temporary)"
  private = "true"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

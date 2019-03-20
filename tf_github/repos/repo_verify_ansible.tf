module "repo_verify_ansible" {
  source = "./verify_repo"

  name = "verify-ansible"
  description = " Ansible for Verify ops "
  private = "true"
  push_teams = [
        "${data.github_team.core.id}",
        "${data.github_team.infrastructure.id}",
      ]
}

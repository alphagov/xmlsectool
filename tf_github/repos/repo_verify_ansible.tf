module "repo_verify_ansible" {
  source = "./verify_repo"

  name = "verify-ansible"
  description = " Ansible for Verify ops "
  private = "true"
  push_teams = [
        "verify-tech-team-core",
        "verify-tech-team-infrastructure",
      ]
}

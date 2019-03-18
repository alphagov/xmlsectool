module "repo_verify_idp_pid_hasherator" {
  source = "./verify_repo"

  name = "verify-idp-pid-hasherator"
  description = "Hash event PIDs from IDP reports for reconciliation"
  private = "false"
  push_teams = [
    "verify-tech-team-core",
  ]
}

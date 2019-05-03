module "repo_verify_dashing" {
  source = "./verify_repo"

  name = "verify-dashing"
  description = "Used to run yak dashboard"
  private = "true"
  allow_push_to_master = "true"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}


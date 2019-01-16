module "repo_verify_jenkins_job_builder" {
  source = "./verify_repo"

  name = "verify-jenkins-job-builder"
  description = "Verify Jenkins Job Builder configuration"
  private = "true"
  push_teams = [
        "verify-tech-team-core",
        "verify-tech-team-infrastructure",
      ]
}

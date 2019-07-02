module "repo_dropwizard_logstash" {
  source = "./verify_repo"

  name = "dropwizard-logstash"
  description = "Dropwizard extension that supports logstash format with various appenders"
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

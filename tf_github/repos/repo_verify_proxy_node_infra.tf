module "repo_verify_proxy_node_infra" {
  source = "./verify_repo"

  name = "verify-proxy-node-infra"
  description = "Verify eIDAS Proxy Node infrastructure"
  private = "true"
  push_teams = [
        "verify-tech-team-eidas-notification",
      ]
}

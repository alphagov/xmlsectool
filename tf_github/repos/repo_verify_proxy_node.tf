module "repo_verify_proxy_node" {
  source = "./verify_repo"

  name = "verify-proxy-node"
  description = "eIDAS Proxy Node"
  private = "false"
  push_teams = [
        "verify-tech-team-eidas-notification",
      ]
}

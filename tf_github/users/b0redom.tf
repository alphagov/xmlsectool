module "user_b0redom" {
  source = "./verify_user"

  username = "b0redom"
  realname = ""
  org_role = "member"
  teams = {
        "verify-tech-team-core-hub" = "member",
        "verify-tech-team-dcs" = "member",
        "verify-tech-team-connecting" = "member",
        "verify-tech-team-infrastructure" = "member",
        "verify-tech-team-eidas-notification" = "member",
        "verify-tech-team-eidas-middleware" = "member",
        "verify-tech-team-frontend" = "member",
        "verify-tech-team-tools" = "member",
      }
}

module "user_irenelau_gds" {
  source = "./verify_user"

  username = "IreneLau-GDS"
  realname = ""
  org_role = "admin"
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

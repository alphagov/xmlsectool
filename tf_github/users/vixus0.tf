module "user_vixus0" {
  source = "./verify_user"

  username = "vixus0"
  realname = "Anshul Sirur"
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

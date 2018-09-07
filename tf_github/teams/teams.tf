module "teams" {
  source = "./verify_teams"

  teams = [
        "verify-tech-team-core-hub",
        "verify-tech-team-dcs",
        "verify-tech-team-connecting",
        "verify-tech-team-infrastructure",
        "verify-tech-team-eidas-notification",
        "verify-tech-team-eidas-middleware",
        "verify-tech-team-frontend",
        "verify-tech-team-performance-pa",
        "verify-tech-team-performance-dev",
        "verify-tech-team-tools",
      ]
}


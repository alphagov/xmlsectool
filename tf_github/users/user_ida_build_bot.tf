module "user_ida_build_bot" {
  source = "./verify_user"

  username = "ida-build-bot"
  org_role = "member"
  teams = [
            "${data.github_team.core.id}",
            "${data.github_team.eidas.id}", 
          ]
}

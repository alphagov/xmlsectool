module "user_chrisholmes" {
  source = "./verify_user"

  username = "chrisholmes"
  realname = "Christopher Holmes"
  org_role = "admin"
  teams = [ 
            "${data.github_team.core.id}",
            "${data.github_team.eidas.id}", 
            "${data.github_team.infrastructure.id}", 
          ]
}

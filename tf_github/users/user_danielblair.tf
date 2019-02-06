module "user_danielblair" {
  source = "./verify_user"

  username = "blairboy362"
  realname = "Daniel Blair"
  org_role = "member"
  teams = [ 
            "${data.github_team.core.id}",
            "${data.github_team.eidas.id}", 
          ]
}

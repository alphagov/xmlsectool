module "user_jhjava" {
  source = "./verify_user"

  username = "JHjava"
  realname = "James Howes"
  org_role = "admin"
  teams = [ 
            "${data.github_team.core.id}",
            "${data.github_team.eidas.id}", 
          ]
}

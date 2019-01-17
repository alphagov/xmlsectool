module "user_chris_wynne" {
  source = "./verify_user"

  username = "Wynndow"
  realname = "Chris Wynne"
  org_role = "member"
  teams = [ 
            "${data.github_team.core.id}",
            "${data.github_team.eidas.id}", 
          ]
}

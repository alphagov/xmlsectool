module "user_adityapahuja" {
  source = "./verify_user"

  username = "adityapahuja"
  realname = "Aditya Pahuja"
  org_role = "member"
  teams = [ 
            "${data.github_team.core.id}",
            "${data.github_team.infrastructure.id}" 
          ]
}

module "user_andy_paine" {
  source = "./verify_user"

  username = "andy-paine"
  realname = "Andy Paine"
  org_role = "admin"
  teams = [ 
            "${data.github_team.core.id}",
            "${data.github_team.infrastructure.id}", 
          ]
}

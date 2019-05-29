module "user_mrwilson" {
  source = "./verify_user"

  username     = "mrwilson"
  realname     = "Alex Wilson"
  can_merge    = "true"
  verify_admin = "false"

  teams = [
    "${data.github_team.core.id}",
  ]
}

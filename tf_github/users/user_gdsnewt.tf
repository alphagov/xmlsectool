module "user_gdsnewt" {
  source = "./verify_user"

  username  = "GDSNewt"
  realname  = "Alex Newton"
  can_merge = "false"

  teams = ["${data.github_team.core.id}"]
}

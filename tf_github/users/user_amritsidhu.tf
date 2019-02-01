module "user_amritsidhu" {
  source = "./verify_user"

  username  = "AmritSidhu"
  realname  = "Amrit Sidhu"
  can_merge = "true"

  teams = ["${data.github_team.core.id}"]
}

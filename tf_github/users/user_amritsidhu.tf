module "user_amritsidhu" {
  source = "./verify_user"

  username = "AmritSidhu"
  realname = "Amrit Sidhu"

  teams = ["${data.github_team.core.id}"]
}

module "user_ida_build_bot" {
  source = "./verify_user"

  username = "ida-build-bot"
  org_role = "member"
  teams = {
      }
}

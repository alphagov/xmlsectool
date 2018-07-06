module "user_minhngocd" {
  source = "./verify_user"

  username = "minhngocd"
  org_role = "member"
  teams = {
      }
}

module "repo_verify_product_page" {
  source = "./verify_repo"

  name = "verify-product-page"
  description = "Product landing page for GOV.UK Verify"
  private = "false"
  push_teams = [
        "${data.github_team.core.id}",
      ]
}

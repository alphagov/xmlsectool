# Verify Github Terraform

We use Terraform to define Verify's repositories, users and teams along with the relevant access controls. Creating a new repository and adding/removing users from teams or the organisation should be done by modifying the Terraform resources defined in this directory.

## Adding or removing users

Users are modified via the files in the `users/` directory. You can add a user by adding a file containing the following:

```terraform
module "user_46bit" {
  source = "./verify_user"

  username = "46bit"
  org_role = "member"
  teams = {
  			"verify-tech-team-core-hub" = "member",
      }
}
```

The filename should be `<github login>.tf`.
The `teams` value is a map determining which teams the user is a part of. They can either be a `member` or a `maintainer`. Removing a user's file from `users/` will remove them from all teams and the organisation.

## Defining teams

Teams are defined in the `teams` list within `teams.tf`. For convenience, it's best to stick with kebab-case (lowercase and hyphenated) for team names.

## Creating a new repository

Add your repository definition to the `repos/` directory with the following Terraform code:

```terraform
module "repo_new_repo" {
  source = "./verify_repo"

  name = "new-repo"
  description = "My new repository"
  private = "false"
  push_teams = [
        "verify-tech-team-core-hub",
      ]
}
```

The filename should be something like `new_repo.tf`.
The `push_teams` value determines which teams' members can create branches and raise PRs against the repository. When the Terraform is applied (via our CI pipeline), the repository will be created with the necessary permisssions.

## Applying changes

Pushing to the master branch triggers the [github-terraform-apply-job](link) which will provision resources on Github. The Terraform state file is checked into this repository.
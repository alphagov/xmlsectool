# Verify Github Terraform

We use Terraform to define Verify's repositories, users and teams along with the relevant access controls. Creating a new repository and adding/removing users from teams or the organisation should be done by modifying the Terraform resources defined in this directory.

## Adding or removing users

Users are modified via the `users.tf` file. You can add a user by adding the following module definition to the file:

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

The `teams` value is a map determining which teams the user is a part of. They can either be a `member` or a `maintainer`. Removing a user's module definition from `users.tf` will remove them from all teams and the organisation.

## Defining teams

Teams are defined in the `teams` list within `teams.tf`. For convenience, it's best to stick with kebab-case (lowercase and hyphenated) for team names.

## Creating a new repository

Add your repository to the `repos.tf` file with the following module definition:

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

The `push_teams` value determines which teams' members can create branches and raise PRs against the repository. When the Terraform is applied (via our CI pipeline), the repository will be created with the necessary permisssions.

## Applying changes

Pushing to the master branch triggers the [github-terraform-apply-job](link) which will provision resources on Github. The Terraform state file is checked into this repository.
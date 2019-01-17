# Verify Github Terraform

We use Terraform to define Verify's repositories, users and teams along with the relevant access controls. Creating a new repository and adding/removing users from teams or the organisation should be done by modifying the Terraform resources defined in this directory.

## Adding or removing users

Users are modified via the files in the `users/` directory. You can add a user by adding a file containing the following:

```terraform
module "user_<github login>" {
  source = "./verify_user"

  username = "<github login>"
  realname = "<real name>"
  org_role = "member"
  teams = [ "${data.github_team.<team>.id}" ]
}
```

The filename should be `user_<github login>.tf`.
The `teams` value defines the list of teams the user is member of. Each repo has a list of teams in the `repos/repo_*.rf` files. Removing a user's file from `users/` will remove them from all teams and the organisation.

## Defining teams

Teams are defined in the `teams` list within `teams/teams.tf`. For convenience, it's best to stick with kebab-case (lowercase and hyphenated) for team names.

To keep the maintenance simple, we have 3 teams:
- `core` - with access to all the Verify repos
- `eidas` - with access to the sensitive eIDAS repos
- `infrastructure` - with access to Verify infrastructure repos

## Creating a new repository

Add your repository definition to the `repos/` directory with the following Terraform code:

```terraform
module "repo_new_repo" {
  source = "./verify_repo"

  name = "new-repo"
  description = "My new repository"
  private = "false"
  push_teams = [
        "verify-tech-team-core",
      ]
}
```

The filename should be something like `new_repo.tf`.
The `push_teams` value determines which teams' members can create branches and raise PRs against the repository. When the Terraform is applied (via our CI pipeline), the repository will be created with the necessary permisssions.

## Applying changes

Pushing to the master branch triggers the [github-terraform-apply-job](link) which will provision resources on Github. The Terraform state file is checked into this repository.

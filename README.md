# Verify Tech Team

This repo exists to store user data for members of the Verify tech team and
our various git repos

## Rationale

We don't have a single source of truth for information about our team members, nor
our github repositories.  We want a lot of information for scripts and bots, but
we can't store unlimited metadata against either github users, GDS google users,
Jenkins users, etc - and we need to know that a person is the same person across
all of these!

Github repositories have very basic 'topic' flags, but no other simple way to
say "when you clone the Verify repos you should get these ones".

## Team user data

This is in the `users.json` file.

This is _not_ meant to replace other (better) identity management systems -
it's mainly so we can _link_ identities between Slack, Github, GDS LDAP and
Jenkins.  Ideally each of these should be the source of truth for users, we
just want to know that @leethaxor on github is @responsible_civil_servant on slack
and is also "Laura.Palmer@digital.cabinet-office.gov.uk"

We can also use it for some metadata if it's hard to store elsewhere - for instance
there is a "roles" entry for tracking who should be notified for Verify release approvals -
but that sort of usage should be avoided.

Team was initially populated from Slack users of the "verify*" channels, so
probably has a number of non-verify users - this should be trimmed down
over time.

### Slack identifiers

On the old slack, people could choose pretty well any name,
and we had to work out handles to message people.

Also, according to https://api.slack.com/changelog/2017-09-the-one-about-usernames we needed to move away from `@username` references - so we built a big lookup of `slack_id` values.

However, on the new slack we know every user has their GDS email as their `display_name` in Slack, and it appears that `<@display_name>` works just fine.  And we no longer have easy access to slack API tokens, so for now we are going to
go back to using the `<@display_name>` to message people.

`slack_id` and `slack_name` still exist for backward compatibility, but once all scripts are updated to use `gds_name` these will be removed!

### Name fields

The following names are in the `users.json` file:

- `gds_name` - this is the user's gds email address up to the `@` symbol.  It is also their Slack `display_name` and should be used to message people in Slack
- `preferred_name` - this is (hopefully) the user's normal full name, and should be used to address them in scripts.
- `names` - this is a list of names the user might have been called in Jenkins or Github or other sources.  It should be searched by scripts that want to fuzzy match users based on those names.  Currently we do exact matches - it might be a worthwhile future improvement to de-dupe these a bit by making them case insensitive and removing `_`, `.` and `-` characters before we check.
- `slack_name` - this is deprecated, and will go away once no scripts need it.

### Roles

There are only two roles at the moment - to ensure someone is asked about release
approvals, add a section like:

```
"roles": [
  "infrastructure-release-approver"
]
```

The roles are `infrastructure-release-approver` for people who can approve an
infrastructure release, and `dev-release-approver` for people
who can approve an app release. You can have both roles, or no `roles` section
at all.

### Adding a new user to the json

"slack_id" - Note: at the time of writing this information is strangely not shown on the individual account page of a member.

You can find this on the slack GUI under "member id".
- Search for the person, select their profile
- Click the chevron next to their name for "more actions"
- Click copy id, it should be a string of 9 alphanumeric characters.  

### Testing

You can test some basics of your JSON - that it parses, that you have
no duplicates - by running `precommit.sh`.  Note you'll need to run
`brew install jq` first if you don't have `jq` installed.

This is set up to work with the http://pre-commit.com/ tool - if you install
pre-commit (with `brew install pre-commit`) and install it for this repo,
json checks will be run before committing.

## Git repo data

This is in the `repositories.json` file.

The git repo data is initially populated from github and then edited by hand
See `scripts/github_repositories.rb` for the initial population script.

This again is not meant to replace what lives in github - but we are
limited on what metadata can be stored there, and we want a place to store
things like "which repos should we clone on a new machine".

Data for a project is similar to:

```
{
  "name": "verify-is-cool",
  "githubData": {
    "description": "Verify is Cool",
    "isFork": false,
    "isPrivate": false,
    "url": "https://github.com/alphagov/verify-is-cool",
    "sshUrl": "git@github.com:alphagov/verify-is-cool.git",
    "topics": [
      "verify"
    ]
  },
  "flags": {
  }
},
```

Everything under `githubData` is extracted from github - in future we should
be automatically updating this once someone writes the code to do so.

Everything under `flags` or any other top-level data is manually added.

### Specific flags

#### isVerifyCoreRepo

This flag is used by the [Verify build scripts](https://github.com/alphagov/verify-build-scripts) to
work out which repos to clone for a standard developer.

#### PREncourager

This is used by [the release encourager bot](https://github.com/alphagov/verify-release-encourager)
to know which repositories to warn users about.

Note the default for the PREncourager is *true* - if you want to disable the encourager or
change any of the following settings, you need to add a `"PREncourager"` section with
`"enabled": false` or any other changes from the default.

Defaults (at time of writing) are:
```
"PREncourager": {
  "enabled": true,
  "minimumDays": 1,
  "warnAfterDays": 30,
  "closeAfterDays": 45
  "slackRecipients": ["verify-tech"]
}
```

See [the readme of the release encourager](https://github.com/alphagov/verify-release-encourager#readme) for more up-to-date information.

## Tools

These should be in the 'scripts' directory to keep the top level directory clean

### get-jenkins-users.rb

This tool gets a list of deployers from verify-puppet and queries them all for
their configured users and admins.  It then presents the data as a table,
making it easy to see which users are configure on which deployers.

Unfortunately the jenkins api is less than ideal making it impractical or
impossible to get the data from the main build instance or the smoketester.

See `./get-jenkins-users.rb -h` output for usage details.

There are some ideas for further improvement and/or integration of this
script, for example the script could correlate the users against users.json,
which would then make it possible for the tool to alert on whether a user is
expect to exist or not.

Make sure you have the right ruby version (use `rbenv version`). Once you have the right version, `gem bundle install` and then `bundle install` to get everything setup.

### check_names_against_github.rb

This script will check all members of the `team-identity-assurance` and `team-identity-assurance-branchers`
teams on github, and warn if they aren't in the `users.json` file.  It does not
(yet) check if the people in the `users.json` file are not in the teams.

### github_repositories.rb

This script queries github for all Verify repositories, and prints the useful
data to standard out.  It doesn't currently merge this with the `repositories.json`
file - updating that file currently has to be done by hand.  It should be
fairly straightforward to write this if you need this feature!

Note you need a github API token to run this script.

Repositories are output which meet these criteria:

- in the `alphagov` organisation
- not locked
- not archived
- any one of:
  - has `verify` as a topic
  - is assigned to the `team-identity-assurance` team
  - matches the Jenkins CI naming pattern:
`verify-* ida-* dropwizard-* dcs-* eidas-* doc-checking gatling puppet-collectd stscreds rmq-lib`

#### a note on caching

This script caches the Github schema in a file `github_schema.json` - delete the
cache if you get API errors, and it will download a new one from github.

If you set an environment variable "CACHE_REPO_DATA=y" it will also cache repository
data from github in `all_repositories_cache.json` - this is mostly for development,
as fetching all data is slow.

It can also be worthwhile turning this cache on to see what other data we get
from github - the cache includes all visible alphagov repos, for example, not
just Verify ones.

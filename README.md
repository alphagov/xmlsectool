# Verify Tech Team

This repo exists to store user data for members of the Verify tech team

This is _not_ meant to replace other (better) identity management systems -
it's mainly so we can _link_ identities between Slack, Github, GDS LDAP and
Jenkins.  Ideally each of these should be the source of truth for users, we
just want to know that @leethaxor on github is @responsible_civil_servant on slack
and is also "Laura.Palmer@digital.cabinet-office.gov.uk"

We can also use it for some metadata if it's hard to store elsewhere - for instance
there is a "roles" entry for tracking who should be notified for Verify release approvals -
but that sort of usage should be avoided.

This was initially populated from Slack users of the "verify*" channels, so
probably has a number of non-verify users - this should be trimmed down
over time.

Note that matching is pretty fuzzy - if two people have the same "Names" entries,
we'll have to tackle that problem when it happens!

## Roles

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

## Testing

You can test some basics of your JSON - that it parses, that you have
no duplicates - by running `precommit.sh`.  Note you'll need to run
`brew install jq` first if you don't have `jq` installed.

This is set up to work with the http://pre-commit.com/ tool - if you install
pre-commit (with `brew install pre-commit`) and install it for this repo,
json checks will be run before committing.

## Tools

## get-jenkins-users.rb

This tool gets a list of deployers from verify-puppet and queries them all for
their configured users and admins.  It then presents the data as a table,
makign it easy to see which users are configure on which deployers.

Unfortunately the jenkins api is less than ideal making it impractical or
impossible to get the data from the main build instance or the smoketester.

See `./get-jenkins-users.rb -h` output for usage details.

There are some ideas for further improvement and/or integration of this
script, for example the script could correlate the users against users.json,
which would then make it possible for the tool to alert on whether a user is
expect to exist or not.

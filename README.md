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

You can test some basics of your JSON - that it parses, that you have
no duplicates - by running `precommit.sh`.  Note you'll need to run
`brew install jq` first if you don't have `jq` installed.

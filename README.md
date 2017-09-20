# Verify Tech Team

This repo exists to store the user data for members of the Verify tech team

For now, this is mostly used to map git users (via their email addresses)
to slack handles for automated slack mentions from various bots.

It is initially populated from Slack users of the "verify*" channels, so
probably has a number of non-verify users - this should be trimmed down
over time.

You can test some basics of your JSON - that it parses, that you have
no duplicates - by running `precommit.sh`.  Note you'll need to run
`brew install jq` first if you don't have `jq` installed.

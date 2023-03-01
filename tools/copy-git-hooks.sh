#!/bin/bash
#
# Copy git hooks.
#
# Do not change the location of this script.


RELATIVE_PATH="$(dirname "$0")"


cp "$RELATIVE_PATH"/hooks/* "$RELATIVE_PATH"/../.git/hooks/ || exit 1
chmod -R 777 "$RELATIVE_PATH"/../.git/hooks/* || exit 1

echo "Git hooks were copied to the .git/hooks/ location"
exit 0

#!/bin/bash
#
# Validates the branch name.


BRANCH_NAME=$(git symbolic-ref --short HEAD)

TASK_PATTERN="^(task|bugfix)/([a-z]+[a-z-]+)-(.+-[0-9]+)$"
RELEASE_PATTERN="^(release)/([0-9]+.[0-9]+.[0-9]+)-(.+-[0-9]+)$"


if ! [[ "$BRANCH_NAME" =~ ^($TASK_PATTERN|$RELEASE_PATTERN)$ ]]
then
 echo """
The branch name does not match the allowed patterns:

  * $TASK_PATTERN
  * $RELEASE_PATTERN

Rename your branch:

  git branch -m task/branch-name-PROJECT-1234

Follow the example."""
  exit 1
fi

echo "Check branch name: good"
exit 0

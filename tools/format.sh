#!/bin/bash
#
# Runs formatters.


SRC="src"
TESTS="tests"


echo "Running formatters: autoflake"
autoflake \
  --in-place --recursive --remove-all-unused-imports \
  $SRC $TESTS \
|| exit 1

echo "Running formatters: isort"
isort $SRC $TESTS || exit 1

echo "Running formatters: black"
black --config=pyproject.toml $SRC $TESTS || exit 1


echo "Check formatters: good"
exit 0

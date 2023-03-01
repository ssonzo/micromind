#!/bin/bash
#
# Runs linters.


SRC="src"
TESTS="tests"


echo "Running linters: mypy"
mypy --config-file=pyproject.toml $SRC $TESTS || exit 1

echo "Running linters: isort"
isort --check-only $SRC $TESTS || exit 1

echo "Running linters: black"
black \
  --diff --color --quiet --check --config=pyproject.toml \
  $SRC $TESTS \
|| exit 1

echo "Running linters: pylint"
pylint \
  --jobs 4 --rcfile=pyproject.toml \
  $SRC $TESTS \
|| exit 1


echo "Check linters: good"
exit 0

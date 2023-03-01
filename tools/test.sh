#!/bin/bash
#
# Runs tests.


SRC="src"
TESTS="tests"


echo "Running tests: pytest"
pytest --cov=$SRC $TESTS || exit 1


echo "Check tests: good"
exit 0

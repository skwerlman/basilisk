#!/usr/bin/env bash

# If any of the following tasks fail, prevent the commit
set -e

# Ensure the code is formatted (and fix it if not)
mix format

# Really ensure the code is formatted
mix credo --strict

# Make sure all the tests pass
mix test

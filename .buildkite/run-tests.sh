#!/usr/bin/env bash
#
# Script to run Elasticsearch container and Elasticsearch client integration tests on Buildkite
#
# Version 0.1
#
script_path=$(dirname $(realpath -s $0))
set -euo pipefail

export EC_PROJECT_PREFIX='sl_ruby'

# Create a serverless project:
source $script_path/create-serverless.sh

# Run the tests:
bash $script_path/run-client.sh

# Make sure we remove projects:
trap cleanup EXIT

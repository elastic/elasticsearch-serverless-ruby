#!/usr/bin/env bash
#
# Script to run Elasticsearch container and Elasticsearch client integration tests on Buildkite
#
# Version 0.1
#
script_path=$(dirname $(realpath -s $0))
set -euo pipefail

if [[ -z $EC_PROJECT_PREFIX ]]; then
  echo -e "\033[31;1mERROR:\033[0m Required environment variable [EC_PROJECT_PREFIX] not set\033[0m"
  exit 1
fi

# Create a serverless project:
source $script_path/create-serverless.sh

# Run the tests:
bash $script_path/run-client.sh

# Make sure we remove projects:
trap cleanup EXIT

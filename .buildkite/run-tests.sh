#!/usr/bin/env bash
#
# Script to run Elasticsearch Serverless and Elasticsearch client integration tests on Buildkite
#
# Required ENV variables to set up:
# EC_PROJECT_PREFIX - will be used for the name of the project. Something short to identify your
# projects in Cloud QA.
# CLOUD_CREDENTIALS_PATH - The path in Vault to your cloud access key. E.g.:
# secret/ci/elastic-elasticsearch-serverless-LANG/cloud-access
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

# Make sure we remove projects:
trap cleanup EXIT

# Run the tests:
bash $script_path/run-client.sh

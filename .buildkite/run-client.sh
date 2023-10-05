#!/usr/bin/env bash
#
script_path=$(dirname $(realpath -s $0))
set -euo pipefail
repo=`pwd`

export RUBY_VERSION=${RUBY_VERSION:-3.2}
export TRANSPORT_VERSION=${TRANSPORT_VERSION:-8}
export RUBY_SOURCE=${RUBY_SOURCE:-ruby}

echo "--- :ruby: Building Docker image"
docker build \
       --file $script_path/Dockerfile \
       --tag elastic/elasticsearch-ruby \
       --build-arg RUBY_VERSION=$RUBY_VERSION \
       --build-arg TRANSPORT_VERSION=$TRANSPORT_VERSION \
       --build-arg RUBY_SOURCE=$RUBY_SOURCE \
       .

echo "--- :ruby: Running $TEST_SUITE tests"

docker run \
       --env "TEST_SUITE=${TEST_SUITE}" \
       --env "ELASTIC_USER=elastic" \
       --env "BUILDKITE=true" \
       --env "TRANSPORT_VERSION=${TRANSPORT_VERSION}" \
       --env "ELASTICSEARCH_URL=${ELASTICSEARCH_URL}" \
       --env "API_KEY=${ES_API_SECRET_KEY}" \
       --volume $repo:/usr/src/app \
       --name elasticsearch-ruby \
       --rm \
       elastic/elasticsearch-ruby \
       bundle exec rake spec:unit info spec:api spec:stack

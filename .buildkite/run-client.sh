#!/usr/bin/env bash
#
script_path=$(dirname $(realpath -s $0))
set -euo pipefail
repo=`pwd`

export RUBY_VERSION=${RUBY_VERSION:-3.2}
export TRANSPORT_VERSION=${TRANSPORT_VERSION:-8}
export RUBY_SOURCE=${RUBY_SOURCE:-ruby}

echo "--- :docker: :ruby: Building Docker image"
docker build \
       --file $script_path/Dockerfile \
       --tag elastic/elasticsearch-ruby \
       --build-arg RUBY_VERSION=$RUBY_VERSION \
       --build-arg TRANSPORT_VERSION=$TRANSPORT_VERSION \
       --build-arg RUBY_SOURCE=$RUBY_SOURCE \
       .

echo "--- :ruby: Running tests"

docker run \
       -e "ELASTIC_USER=elastic" \
       -e "BUILDKITE=true" \
       -e "QUIET=${QUIET}" \
       -e "TRANSPORT_VERSION=${TRANSPORT_VERSION}" \
       -e "ELASTICSEARCH_URL=${ELASTICSEARCH_URL}" \
       -e "API_KEY=${ES_API_SECRET_KEY}" \
       --volume $repo:/usr/src/app \
       --name elasticsearch-ruby \
       --rm \
       elastic/elasticsearch-ruby \
       bundle exec rake info spec:otel spec:api spec:stack spec:yaml

# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
# Auto generated from commit f284cc16f4d4b4289bc679aa1529bb504190fe80
# @see https://github.com/elastic/elasticsearch-specification
#
module ElasticsearchServerless
  module API
    module MachineLearning
      module Actions
        # Instantiates a datafeed.
        # Datafeeds retrieve data from Elasticsearch for analysis by an anomaly detection job.
        # You can associate only one datafeed with each anomaly detection job.
        # The datafeed contains a query that runs at a defined interval (`frequency`).
        # If you are concerned about delayed data, you can add a delay (`query_delay') at each interval.
        # When Elasticsearch security features are enabled, your datafeed remembers which roles the user who created it had
        # at the time of creation and runs the query using those same roles. If you provide secondary authorization headers,
        # those credentials are used instead.
        # You must use Kibana, this API, or the create anomaly detection jobs API to create a datafeed. Do not add a datafeed
        # directly to the `.ml-config` index. Do not give users `write` privileges on the `.ml-config` index.
        #
        # @option arguments [String] :datafeed_id A numerical character string that uniquely identifies the datafeed. This identifier can contain lowercase alphanumeric characters (a-z and 0-9), hyphens, and underscores. It must start and end with alphanumeric characters. (*Required*)
        # @option arguments [Boolean] :allow_no_indices If true, wildcard indices expressions that resolve into no concrete indices are ignored. This includes the +_all+ string or when no indices are specified. Server default: true.
        # @option arguments [String, Array<String>] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values. Server default: open.
        # @option arguments [Boolean] :ignore_throttled If true, concrete, expanded, or aliased indices are ignored when frozen. Server default: true.
        # @option arguments [Boolean] :ignore_unavailable If true, unavailable indices (missing or closed) are ignored.
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body request body
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-put-datafeed.html
        #
        def put_datafeed(arguments = {})
          raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]
          raise ArgumentError, "Required argument 'datafeed_id' missing" unless arguments[:datafeed_id]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          _datafeed_id = arguments.delete(:datafeed_id)

          method = ElasticsearchServerless::API::HTTP_PUT
          path   = "_ml/datafeeds/#{Utils.listify(_datafeed_id)}"
          params = Utils.process_params(arguments)

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end

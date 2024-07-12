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
        # Updates the properties of a datafeed.
        # You must stop and start the datafeed for the changes to be applied.
        # When Elasticsearch security features are enabled, your datafeed remembers which roles the user who updated it had at
        # the time of the update and runs the query using those same roles. If you provide secondary authorization headers,
        # those credentials are used instead.
        #
        # @option arguments [String] :datafeed_id A numerical character string that uniquely identifies the datafeed. This identifier can contain lowercase alphanumeric characters (a-z and 0-9), hyphens, and underscores. It must start and end with alphanumeric characters. (*Required*)
        # @option arguments [Boolean] :allow_no_indices If +true+, wildcard indices expressions that resolve into no concrete indices are ignored. This includes the +_all+ string or when no indices are specified. Server default: true.
        # @option arguments [String, Array<String>] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values. Valid values are:  * +all+: Match any data stream or index, including hidden ones. * +closed+: Match closed, non-hidden indices. Also matches any non-hidden data stream. Data streams cannot be closed. * +hidden+: Match hidden data streams and hidden indices. Must be combined with +open+, +closed+, or both. * +none+: Wildcard patterns are not accepted. * +open+: Match open, non-hidden indices. Also matches any non-hidden data stream. Server default: open.
        # @option arguments [Boolean] :ignore_throttled If +true+, concrete, expanded or aliased indices are ignored when frozen. Server default: true.
        # @option arguments [Boolean] :ignore_unavailable If +true+, unavailable indices (missing or closed) are ignored.
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body request body
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-update-datafeed.html
        #
        def update_datafeed(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || "ml.update_datafeed" }

          defined_params = [:datafeed_id].inject({}) do |set_variables, variable|
            set_variables[variable] = arguments[variable] if arguments.key?(variable)
            set_variables
          end
          request_opts[:defined_params] = defined_params unless defined_params.empty?

          raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]
          raise ArgumentError, "Required argument 'datafeed_id' missing" unless arguments[:datafeed_id]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          _datafeed_id = arguments.delete(:datafeed_id)

          method = ElasticsearchServerless::API::HTTP_POST
          path   = "_ml/datafeeds/#{Utils.listify(_datafeed_id)}/_update"
          params = Utils.process_params(arguments)

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end

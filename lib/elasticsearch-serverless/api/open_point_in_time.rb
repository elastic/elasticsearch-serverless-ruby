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
    module Actions
      # Open a point in time that can be used in subsequent searches
      #
      # @option arguments [String, Array] :index A comma-separated list of index names to open point in time; use +_all+ or empty string to perform the operation on all indices (*Required*)
      # @option arguments [Time] :keep_alive Specific the time to live for the point in time (*Required*)
      # @option arguments [Boolean] :ignore_unavailable Whether specified concrete indices should be ignored when unavailable (missing or closed)
      # @option arguments [String] :preference Specify the node or shard the operation should be performed on (default: random)
      # @option arguments [String] :routing Specific routing value
      # @option arguments [String, Array<String>] :expand_wildcards Whether to expand wildcard expression to concrete indices that are open, closed or both.
      # @option arguments [Hash] :headers Custom HTTP headers
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/point-in-time-api.html
      #
      def open_point_in_time(arguments = {})
        raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]

        arguments = arguments.clone
        headers = arguments.delete(:headers) || {}

        body = nil

        _index = arguments.delete(:index)

        method = ElasticsearchServerless::API::HTTP_POST
        path   = "#{Utils.listify(_index)}/_pit"
        params = Utils.process_params(arguments)

        ElasticsearchServerless::API::Response.new(
          perform_request(method, path, params, body, headers)
        )
      end
    end
  end
end

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
      # Open a point in time.
      # A search request by default runs against the most recent visible data of the target indices,
      # which is called point in time. Elasticsearch pit (point in time) is a lightweight view into the
      # state of the data as it existed when initiated. In some cases, it’s preferred to perform multiple
      # search requests using the same point in time. For example, if refreshes happen between
      # +search_after+ requests, then the results of those requests might not be consistent as changes happening
      # between searches are only visible to the more recent point in time.
      # A point in time must be opened explicitly before being used in search requests.
      # The +keep_alive+ parameter tells Elasticsearch how long it should persist.
      #
      # @option arguments [String, Array] :index A comma-separated list of index names to open point in time; use +_all+ or empty string to perform the operation on all indices (*Required*)
      # @option arguments [Time] :keep_alive Extends the time to live of the corresponding point in time. (*Required*)
      # @option arguments [Boolean] :ignore_unavailable If +false+, the request returns an error if it targets a missing or closed index.
      # @option arguments [String] :preference Specifies the node or shard the operation should be performed on.
      #  Random by default.
      # @option arguments [String] :routing Custom value used to route operations to a specific shard.
      # @option arguments [String, Array<String>] :expand_wildcards Type of index that wildcard patterns can match.
      #  If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams.
      #  Supports comma-separated values, such as +open,hidden+. Valid values are: +all+, +open+, +closed+, +hidden+, +none+. Server default: open.
      # @option arguments [Boolean] :allow_partial_search_results If +false+, creating a point in time request when a shard is missing or unavailable will throw an exception.
      #  If +true+, the point in time will contain all the shards that are available at the time of the request.
      # @option arguments [Hash] :headers Custom HTTP headers
      # @option arguments [Hash] :body request body
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/point-in-time-api.html
      #
      def open_point_in_time(arguments = {})
        request_opts = { endpoint: arguments[:endpoint] || "open_point_in_time" }

        defined_params = [:index].inject({}) do |set_variables, variable|
          set_variables[variable] = arguments[variable] if arguments.key?(variable)
          set_variables
        end
        request_opts[:defined_params] = defined_params unless defined_params.empty?

        raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]

        arguments = arguments.clone
        headers = arguments.delete(:headers) || {}

        body = arguments.delete(:body)

        _index = arguments.delete(:index)

        method = ElasticsearchServerless::API::HTTP_POST
        path   = "#{Utils.listify(_index)}/_pit"
        params = Utils.process_params(arguments)

        ElasticsearchServerless::API::Response.new(
          perform_request(method, path, params, body, headers, request_opts)
        )
      end
    end
  end
end

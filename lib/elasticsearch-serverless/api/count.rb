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
      # Returns number of documents matching a query.
      #
      # @option arguments [String, Array] :index Comma-separated list of data streams, indices, and aliases to search. Supports wildcards (+*+). To search all data streams and indices, omit this parameter or use +*+ or +_all+.
      # @option arguments [Boolean] :allow_no_indices If +false+, the request returns an error if any wildcard expression, index alias, or +_all+ value targets only missing or closed indices. This behavior applies even if the request targets other open indices. Server default: true.
      # @option arguments [String] :analyzer Analyzer to use for the query string. This parameter can only be used when the +q+ query string parameter is specified.
      # @option arguments [Boolean] :analyze_wildcard If +true+, wildcard and prefix queries are analyzed. This parameter can only be used when the +q+ query string parameter is specified.
      # @option arguments [String] :default_operator The default operator for query string query: +AND+ or +OR+. This parameter can only be used when the +q+ query string parameter is specified.
      # @option arguments [String] :df Field to use as default where no field prefix is given in the query string. This parameter can only be used when the +q+ query string parameter is specified.
      # @option arguments [String, Array<String>] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as +open,hidden+. Server default: open.
      # @option arguments [Boolean] :ignore_throttled If +true+, concrete, expanded or aliased indices are ignored when frozen. Server default: true.
      # @option arguments [Boolean] :ignore_unavailable If +false+, the request returns an error if it targets a missing or closed index.
      # @option arguments [Boolean] :lenient If +true+, format-based query failures (such as providing text to a numeric field) in the query string will be ignored.
      # @option arguments [Float] :min_score Sets the minimum +_score+ value that documents must have to be included in the result.
      # @option arguments [String] :preference Specifies the node or shard the operation should be performed on. Random by default.
      # @option arguments [String] :routing Custom value used to route operations to a specific shard.
      # @option arguments [Integer] :terminate_after Maximum number of documents to collect for each shard. If a query reaches this limit, Elasticsearch terminates the query early. Elasticsearch collects documents before sorting.
      # @option arguments [String] :q Query in the Lucene query string syntax.
      # @option arguments [Hash] :headers Custom HTTP headers
      # @option arguments [Hash] :body request body
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/search-count.html
      #
      def count(arguments = {})
        request_opts = { endpoint: arguments[:endpoint] || "count" }

        defined_params = [:index].inject({}) do |set_variables, variable|
          set_variables[variable] = arguments[variable] if arguments.key?(variable)
          set_variables
        end
        request_opts[:defined_params] = defined_params unless defined_params.empty?

        arguments = arguments.clone
        headers = arguments.delete(:headers) || {}

        body = arguments.delete(:body)

        _index = arguments.delete(:index)

        method = if body
                   ElasticsearchServerless::API::HTTP_POST
                 else
                   ElasticsearchServerless::API::HTTP_GET
                 end

        path   = if _index
                   "#{Utils.listify(_index)}/_count"
                 else
                   "_count"
                 end
        params = Utils.process_params(arguments)

        ElasticsearchServerless::API::Response.new(
          perform_request(method, path, params, body, headers, request_opts)
        )
      end
    end
  end
end

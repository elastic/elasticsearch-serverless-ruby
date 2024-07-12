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
      # Deletes documents that match the specified query.
      #
      # @option arguments [String, Array] :index Comma-separated list of data streams, indices, and aliases to search. Supports wildcards (+*+). To search all data streams or indices, omit this parameter or use +*+ or +_all+. (*Required*)
      # @option arguments [Boolean] :allow_no_indices If +false+, the request returns an error if any wildcard expression, index alias, or +_all+ value targets only missing or closed indices. This behavior applies even if the request targets other open indices. For example, a request targeting +foo*,bar*+ returns an error if an index starts with +foo+ but no index starts with +bar+. Server default: true.
      # @option arguments [String] :analyzer Analyzer to use for the query string.
      # @option arguments [Boolean] :analyze_wildcard If +true+, wildcard and prefix queries are analyzed.
      # @option arguments [String] :conflicts What to do if delete by query hits version conflicts: +abort+ or +proceed+. Server default: abort.
      # @option arguments [String] :default_operator The default operator for query string query: +AND+ or +OR+. Server default: OR.
      # @option arguments [String] :df Field to use as default where no field prefix is given in the query string.
      # @option arguments [String, Array<String>] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as +open,hidden+. Valid values are: +all+, +open+, +closed+, +hidden+, +none+. Server default: open.
      # @option arguments [Integer] :from Starting offset (default: 0)
      # @option arguments [Boolean] :ignore_unavailable If +false+, the request returns an error if it targets a missing or closed index.
      # @option arguments [Boolean] :lenient If +true+, format-based query failures (such as providing text to a numeric field) in the query string will be ignored.
      # @option arguments [Integer] :max_docs Maximum number of documents to process. Defaults to all documents.
      # @option arguments [String] :preference Specifies the node or shard the operation should be performed on. Random by default.
      # @option arguments [Boolean] :refresh If +true+, Elasticsearch refreshes all shards involved in the delete by query after the request completes.
      # @option arguments [Boolean] :request_cache If +true+, the request cache is used for this request. Defaults to the index-level setting.
      # @option arguments [Float] :requests_per_second The throttle for this request in sub-requests per second.
      # @option arguments [String] :routing Custom value used to route operations to a specific shard.
      # @option arguments [String] :q Query in the Lucene query string syntax.
      # @option arguments [Time] :scroll Period to retain the search context for scrolling.
      # @option arguments [Integer] :scroll_size Size of the scroll request that powers the operation. Server default: 1000.
      # @option arguments [Time] :search_timeout Explicit timeout for each search request. Defaults to no timeout.
      # @option arguments [String] :search_type The type of the search operation. Available options: +query_then_fetch+, +dfs_query_then_fetch+.
      # @option arguments [Integer, String] :slices The number of slices this task should be divided into. Server default: 1.
      # @option arguments [Array<String>] :sort A comma-separated list of <field>:<direction> pairs.
      # @option arguments [Array<String>] :stats Specific +tag+ of the request for logging and statistical purposes.
      # @option arguments [Integer] :terminate_after Maximum number of documents to collect for each shard. If a query reaches this limit, Elasticsearch terminates the query early. Elasticsearch collects documents before sorting. Use with caution. Elasticsearch applies this parameter to each shard handling the request. When possible, let Elasticsearch perform early termination automatically. Avoid specifying this parameter for requests that target data streams with backing indices across multiple data tiers.
      # @option arguments [Time] :timeout Period each deletion request waits for active shards. Server default: 1m.
      # @option arguments [Boolean] :version If +true+, returns the document version as part of a hit.
      # @option arguments [Integer, String] :wait_for_active_shards The number of shard copies that must be active before proceeding with the operation. Set to all or any positive integer up to the total number of shards in the index (+number_of_replicas+1+). Server default: 1.
      # @option arguments [Boolean] :wait_for_completion If +true+, the request blocks until the operation is complete. Server default: true.
      # @option arguments [Hash] :headers Custom HTTP headers
      # @option arguments [Hash] :body request body
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-delete-by-query.html
      #
      def delete_by_query(arguments = {})
        request_opts = { endpoint: arguments[:endpoint] || "delete_by_query" }

        defined_params = [:index].inject({}) do |set_variables, variable|
          set_variables[variable] = arguments[variable] if arguments.key?(variable)
          set_variables
        end
        request_opts[:defined_params] = defined_params unless defined_params.empty?

        raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]
        raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]

        arguments = arguments.clone
        headers = arguments.delete(:headers) || {}

        body = arguments.delete(:body)

        _index = arguments.delete(:index)

        method = ElasticsearchServerless::API::HTTP_POST
        path   = "#{Utils.listify(_index)}/_delete_by_query"
        params = Utils.process_params(arguments)

        ElasticsearchServerless::API::Response.new(
          perform_request(method, path, params, body, headers, request_opts)
        )
      end
    end
  end
end

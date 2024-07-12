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
      # Returns search hits that match the query defined in the request.
      # You can provide search queries using the +q+ query string parameter or the request body.
      # If both are specified, only the query parameter is used.
      #
      # @option arguments [String, Array] :index Comma-separated list of data streams, indices, and aliases to search. Supports wildcards (+*+). To search all data streams and indices, omit this parameter or use +*+ or +_all+.
      # @option arguments [Boolean] :allow_no_indices If +false+, the request returns an error if any wildcard expression, index alias, or +_all+ value targets only missing or closed indices. This behavior applies even if the request targets other open indices. For example, a request targeting +foo*,bar*+ returns an error if an index starts with +foo+ but no index starts with +bar+. Server default: true.
      # @option arguments [Boolean] :allow_partial_search_results If true, returns partial results if there are shard request timeouts or shard failures. If false, returns an error with no partial results. Server default: true.
      # @option arguments [String] :analyzer Analyzer to use for the query string. This parameter can only be used when the q query string parameter is specified.
      # @option arguments [Boolean] :analyze_wildcard If true, wildcard and prefix queries are analyzed. This parameter can only be used when the q query string parameter is specified.
      # @option arguments [Integer] :batched_reduce_size The number of shard results that should be reduced at once on the coordinating node. This value should be used as a protection mechanism to reduce the memory overhead per search request if the potential number of shards in the request can be large. Server default: 512.
      # @option arguments [Boolean] :ccs_minimize_roundtrips If true, network round-trips between the coordinating node and the remote clusters are minimized when executing cross-cluster search (CCS) requests. Server default: true.
      # @option arguments [String] :default_operator The default operator for query string query: AND or OR. This parameter can only be used when the +q+ query string parameter is specified. Server default: OR.
      # @option arguments [String] :df Field to use as default where no field prefix is given in the query string. This parameter can only be used when the q query string parameter is specified.
      # @option arguments [String, Array<String>] :docvalue_fields A comma-separated list of fields to return as the docvalue representation for each hit.
      # @option arguments [String, Array<String>] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as +open,hidden+.
      # @option arguments [Boolean] :explain If +true+, returns detailed information about score computation as part of a hit.
      # @option arguments [Boolean] :ignore_throttled If +true+, concrete, expanded or aliased indices will be ignored when frozen. Server default: true.
      # @option arguments [Boolean] :ignore_unavailable If +false+, the request returns an error if it targets a missing or closed index.
      # @option arguments [Boolean] :lenient If +true+, format-based query failures (such as providing text to a numeric field) in the query string will be ignored. This parameter can only be used when the +q+ query string parameter is specified.
      # @option arguments [Integer] :max_concurrent_shard_requests Defines the number of concurrent shard requests per node this search executes concurrently. This value should be used to limit the impact of the search on the cluster in order to limit the number of concurrent shard requests. Server default: 5.
      # @option arguments [String] :min_compatible_shard_node The minimum version of the node that can handle the request Any handling node with a lower version will fail the request.
      # @option arguments [String] :preference Nodes and shards used for the search. By default, Elasticsearch selects from eligible nodes and shards using adaptive replica selection, accounting for allocation awareness. Valid values are: +_only_local+ to run the search only on shards on the local node; +_local+ to, if possible, run the search on shards on the local node, or if not, select shards using the default method; +_only_nodes:<node-id>,<node-id>+ to run the search on only the specified nodes IDs, where, if suitable shards exist on more than one selected node, use shards on those nodes using the default method, or if none of the specified nodes are available, select shards from any available node using the default method; +_prefer_nodes:<node-id>,<node-id>+ to if possible, run the search on the specified nodes IDs, or if not, select shards using the default method; +_shards:<shard>,<shard>+ to run the search only on the specified shards; +<custom-string>+ (any string that does not start with +_+) to route searches with the same +<custom-string>+ to the same shards in the same order.
      # @option arguments [Integer] :pre_filter_shard_size Defines a threshold that enforces a pre-filter roundtrip to prefilter search shards based on query rewriting if the number of shards the search request expands to exceeds the threshold. This filter roundtrip can limit the number of shards significantly if for instance a shard can not match any documents based on its rewrite method (if date filters are mandatory to match but the shard bounds and the query are disjoint). When unspecified, the pre-filter phase is executed if any of these conditions is met: the request targets more than 128 shards; the request targets one or more read-only index; the primary sort of the query targets an indexed field.
      # @option arguments [Boolean] :request_cache If +true+, the caching of search results is enabled for requests where +size+ is +0+. Defaults to index level settings.
      # @option arguments [String] :routing Custom value used to route operations to a specific shard.
      # @option arguments [Time] :scroll Period to retain the search context for scrolling. See Scroll search results. By default, this value cannot exceed +1d+ (24 hours). You can change this limit using the +search.max_keep_alive+ cluster-level setting.
      # @option arguments [String] :search_type How distributed term frequencies are calculated for relevance scoring.
      # @option arguments [Array<String>] :stats Specific +tag+ of the request for logging and statistical purposes.
      # @option arguments [String, Array<String>] :stored_fields A comma-separated list of stored fields to return as part of a hit. If no fields are specified, no stored fields are included in the response. If this field is specified, the +_source+ parameter defaults to +false+. You can pass +_source: true+ to return both source fields and stored fields in the search response.
      # @option arguments [String] :suggest_field Specifies which field to use for suggestions.
      # @option arguments [String] :suggest_mode Specifies the suggest mode. This parameter can only be used when the +suggest_field+ and +suggest_text+ query string parameters are specified. Server default: missing.
      # @option arguments [Integer] :suggest_size Number of suggestions to return. This parameter can only be used when the +suggest_field+ and +suggest_text+ query string parameters are specified.
      # @option arguments [String] :suggest_text The source text for which the suggestions should be returned. This parameter can only be used when the +suggest_field+ and +suggest_text+ query string parameters are specified.
      # @option arguments [Integer] :terminate_after Maximum number of documents to collect for each shard. If a query reaches this limit, Elasticsearch terminates the query early. Elasticsearch collects documents before sorting. Use with caution. Elasticsearch applies this parameter to each shard handling the request. When possible, let Elasticsearch perform early termination automatically. Avoid specifying this parameter for requests that target data streams with backing indices across multiple data tiers. If set to +0+ (default), the query does not terminate early. Server default: 0.
      # @option arguments [Time] :timeout Specifies the period of time to wait for a response from each shard. If no response is received before the timeout expires, the request fails and returns an error.
      # @option arguments [Boolean, Integer] :track_total_hits Number of hits matching the query to count accurately. If +true+, the exact number of hits is returned at the cost of some performance. If +false+, the response does not include the total number of hits matching the query. Server default: 10000.
      # @option arguments [Boolean] :track_scores If +true+, calculate and return document scores, even if the scores are not used for sorting.
      # @option arguments [Boolean] :typed_keys If +true+, aggregation and suggester names are be prefixed by their respective types in the response. Server default: true.
      # @option arguments [Boolean] :rest_total_hits_as_int Indicates whether +hits.total+ should be rendered as an integer or an object in the rest search response.
      # @option arguments [Boolean] :version If +true+, returns document version as part of a hit.
      # @option arguments [Boolean, String, Array<String>] :_source Indicates which source fields are returned for matching documents. These fields are returned in the +hits._source+ property of the search response. Valid values are: +true+ to return the entire document source; +false+ to not return the document source; +<string>+ to return the source fields that are specified as a comma-separated list (supports wildcard (+*+) patterns). Server default: true.
      # @option arguments [String, Array<String>] :_source_excludes A comma-separated list of source fields to exclude from the response. You can also use this parameter to exclude fields from the subset specified in +_source_includes+ query parameter. If the +_source+ parameter is +false+, this parameter is ignored.
      # @option arguments [String, Array<String>] :_source_includes A comma-separated list of source fields to include in the response. If this parameter is specified, only these source fields are returned. You can exclude fields from this subset using the +_source_excludes+ query parameter. If the +_source+ parameter is +false+, this parameter is ignored.
      # @option arguments [Boolean] :seq_no_primary_term If +true+, returns sequence number and primary term of the last modification of each hit.
      # @option arguments [String] :q Query in the Lucene query string syntax using query parameter search. Query parameter searches do not support the full Elasticsearch Query DSL but are handy for testing.
      # @option arguments [Integer] :size Defines the number of hits to return. By default, you cannot page through more than 10,000 hits using the +from+ and +size+ parameters. To page through more hits, use the +search_after+ parameter. Server default: 10.
      # @option arguments [Integer] :from Starting document offset. Needs to be non-negative. By default, you cannot page through more than 10,000 hits using the +from+ and +size+ parameters. To page through more hits, use the +search_after+ parameter. Server default: 0.
      # @option arguments [String] :sort A comma-separated list of <field>:<direction> pairs.
      # @option arguments [Boolean] :force_synthetic_source Should this request force synthetic _source? Use this to test if the mapping supports synthetic _source and to get a sense of the worst case performance. Fetches with this enabled will be slower the enabling synthetic source natively in the index.
      # @option arguments [Hash] :headers Custom HTTP headers
      # @option arguments [Hash] :body request body
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/search-search.html
      #
      def search(arguments = {})
        request_opts = { endpoint: arguments[:endpoint] || "search" }

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
                   "#{Utils.listify(_index)}/_search"
                 else
                   "_search"
                 end
        params = Utils.process_params(arguments)

        ElasticsearchServerless::API::Response.new(
          perform_request(method, path, params, body, headers, request_opts)
        )
      end
    end
  end
end

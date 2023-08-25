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
      # Allows to execute several search operations in one request.
      #
      # @option arguments [String, Array] :index Comma-separated list of data streams, indices, and index aliases to search.
      # @option arguments [Boolean] :allow_no_indices If false, the request returns an error if any wildcard expression, index alias, or _all value targets only missing or closed indices. This behavior applies even if the request targets other open indices. For example, a request targeting foo*,bar* returns an error if an index starts with foo but no index starts with bar.
      # @option arguments [Boolean] :ccs_minimize_roundtrips If true, network roundtrips between the coordinating node and remote clusters are minimized for cross-cluster search requests. Server default: true.
      # @option arguments [String, Array<String>] :expand_wildcards Type of index that wildcard expressions can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams.
      # @option arguments [Boolean] :ignore_throttled If true, concrete, expanded or aliased indices are ignored when frozen.
      # @option arguments [Boolean] :ignore_unavailable If true, missing or closed indices are not included in the response.
      # @option arguments [Integer] :max_concurrent_searches Maximum number of concurrent searches the multi search API can execute.
      # @option arguments [Integer] :max_concurrent_shard_requests Maximum number of concurrent shard requests that each sub-search request executes per node. Server default: 5.
      # @option arguments [Integer] :pre_filter_shard_size Defines a threshold that enforces a pre-filter roundtrip to prefilter search shards based on query rewriting if the number of shards the search request expands to exceeds the threshold. This filter roundtrip can limit the number of shards significantly if for instance a shard can not match any documents based on its rewrite method i.e., if date filters are mandatory to match but the shard bounds and the query are disjoint.
      # @option arguments [Boolean] :rest_total_hits_as_int If true, hits.total are returned as an integer in the response. Defaults to false, which returns an object.
      # @option arguments [String] :routing Custom routing value used to route search operations to a specific shard.
      # @option arguments [String] :search_type Indicates whether global term and document frequencies should be used when scoring returned documents.
      # @option arguments [Boolean] :typed_keys Specifies whether aggregation and suggester names should be prefixed by their respective types in the response.
      # @option arguments [Hash] :headers Custom HTTP headers
      # @option arguments [Hash] :body searches
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/search-multi-search.html
      #
      def msearch(arguments = {})
        raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]

        arguments = arguments.clone
        headers = arguments.delete(:headers) || {}

        body = arguments.delete(:body)

        _index = arguments.delete(:index)

        method = ElasticsearchServerless::API::HTTP_POST
        path   = if _index
                   "#{Utils.listify(_index)}/_msearch"
                 else
                   "_msearch"
                 end
        params = Utils.process_params(arguments)

        case
        when body.is_a?(Array) && body.any? { |d| d.has_key? :search }
          payload = body
                    .inject([]) do |sum, item|
                      meta = item
                      data = meta.delete(:search)

                      sum << meta
                      sum << data
                      sum
                    end
                    .map { |item| ElasticsearchServerless::API.serializer.dump(item) }
          payload << "" unless payload.empty?
          payload = payload.join("\n")
        when body.is_a?(Array)
          payload = body.map { |d| d.is_a?(String) ? d : ElasticsearchServerless::API.serializer.dump(d) }
          payload << "" unless payload.empty?
          payload = payload.join("\n")
        else
          payload = body
        end

        headers.merge!("Content-Type" => "application/x-ndjson")
        ElasticsearchServerless::API::Response.new(
          perform_request(method, path, params, payload, headers)
        )
      end
    end
  end
end

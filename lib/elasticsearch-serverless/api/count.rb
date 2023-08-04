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
      # @option arguments [String, Array] :index A comma-separated list of indices to restrict the results
      # @option arguments [Boolean] :allow_no_indices Whether to ignore if a wildcard indices expression resolves into no concrete indices. (This includes +_all+ string or when no indices have been specified)
      # @option arguments [String] :analyzer The analyzer to use for the query string
      # @option arguments [Boolean] :analyze_wildcard Specify whether wildcard and prefix queries should be analyzed (default: false)
      # @option arguments [String] :default_operator The default operator for query string query (AND or OR)
      # @option arguments [String] :df The field to use as default where no field prefix is given in the query string
      # @option arguments [String, Array<String>] :expand_wildcards Whether to expand wildcard expression to concrete indices that are open, closed or both.
      # @option arguments [Boolean] :ignore_throttled Whether specified concrete, expanded or aliased indices should be ignored when throttled
      # @option arguments [Boolean] :ignore_unavailable Whether specified concrete indices should be ignored when unavailable (missing or closed)
      # @option arguments [Boolean] :lenient Specify whether format-based query failures (such as providing text to a numeric field) should be ignored
      # @option arguments [Float] :min_score Include only documents with a specific +_score+ value in the result
      # @option arguments [String] :preference Specify the node or shard the operation should be performed on (default: random)
      # @option arguments [String] :routing A comma-separated list of specific routing values
      # @option arguments [Integer] :terminate_after The maximum count for each shard, upon reaching which the query execution will terminate early
      # @option arguments [String] :q Query in the Lucene query string syntax
      # @option arguments [Hash] :headers Custom HTTP headers
      # @option arguments [Hash] :body request body
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/search-count.html
      #
      def count(arguments = {})
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
          perform_request(method, path, params, body, headers)
        )
      end
    end
  end
end
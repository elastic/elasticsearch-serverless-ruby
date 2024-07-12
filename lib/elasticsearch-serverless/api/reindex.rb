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
      # Allows to copy documents from one index to another, optionally filtering the source
      # documents by a query, changing the destination index settings, or fetching the
      # documents from a remote cluster.
      #
      # @option arguments [Boolean] :refresh If +true+, the request refreshes affected shards to make this operation visible to search.
      # @option arguments [Float] :requests_per_second The throttle for this request in sub-requests per second. Defaults to no throttle. Server default: -1.
      # @option arguments [Time] :scroll Specifies how long a consistent view of the index should be maintained for scrolled search.
      # @option arguments [Integer, String] :slices The number of slices this task should be divided into. Defaults to 1 slice, meaning the task isn’t sliced into subtasks. Server default: 1.
      # @option arguments [Time] :timeout Period each indexing waits for automatic index creation, dynamic mapping updates, and waiting for active shards. Server default: 1m.
      # @option arguments [Integer, String] :wait_for_active_shards The number of shard copies that must be active before proceeding with the operation. Set to +all+ or any positive integer up to the total number of shards in the index (+number_of_replicas+1+). Server default: 1.
      # @option arguments [Boolean] :wait_for_completion If +true+, the request blocks until the operation is complete. Server default: true.
      # @option arguments [Boolean] :require_alias If +true+, the destination must be an index alias.
      # @option arguments [Hash] :headers Custom HTTP headers
      # @option arguments [Hash] :body request body
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-reindex.html
      #
      def reindex(arguments = {})
        request_opts = { endpoint: arguments[:endpoint] || "reindex" }

        raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]

        arguments = arguments.clone
        headers = arguments.delete(:headers) || {}

        body = arguments.delete(:body)

        method = ElasticsearchServerless::API::HTTP_POST
        path   = "_reindex"
        params = Utils.process_params(arguments)

        ElasticsearchServerless::API::Response.new(
          perform_request(method, path, params, body, headers, request_opts)
        )
      end
    end
  end
end

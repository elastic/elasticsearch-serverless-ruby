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
      # Bulk index or delete documents.
      # Performs multiple indexing or delete operations in a single API call.
      # This reduces overhead and can greatly increase indexing speed.
      #
      # @option arguments [String] :index Name of the data stream, index, or index alias to perform bulk actions on.
      # @option arguments [Boolean] :list_executed_pipelines If +true+, the response will include the ingest pipelines that were executed for each index or create.
      # @option arguments [String] :pipeline ID of the pipeline to use to preprocess incoming documents.
      #  If the index has a default ingest pipeline specified, then setting the value to +_none+ disables the default ingest pipeline for this request.
      #  If a final pipeline is configured it will always run, regardless of the value of this parameter.
      # @option arguments [String] :refresh If +true+, Elasticsearch refreshes the affected shards to make this operation visible to search, if +wait_for+ then wait for a refresh to make this operation visible to search, if +false+ do nothing with refreshes.
      #  Valid values: +true+, +false+, +wait_for+. Server default: false.
      # @option arguments [String] :routing Custom value used to route operations to a specific shard.
      # @option arguments [Boolean, String, Array<String>] :_source +true+ or +false+ to return the +_source+ field or not, or a list of fields to return.
      # @option arguments [String, Array<String>] :_source_excludes A comma-separated list of source fields to exclude from the response.
      # @option arguments [String, Array<String>] :_source_includes A comma-separated list of source fields to include in the response.
      # @option arguments [Time] :timeout Period each action waits for the following operations: automatic index creation, dynamic mapping updates, waiting for active shards. Server default: 1m.
      # @option arguments [Integer, String] :wait_for_active_shards The number of shard copies that must be active before proceeding with the operation.
      #  Set to all or any positive integer up to the total number of shards in the index (+number_of_replicas+1+). Server default: 1.
      # @option arguments [Boolean] :require_alias If +true+, the request’s actions must target an index alias.
      # @option arguments [Boolean] :require_data_stream If +true+, the request's actions must target a data stream (existing or to-be-created).
      # @option arguments [Hash] :headers Custom HTTP headers
      # @option arguments [String|Array] :body operations. Array of Strings, Header/Data pairs, or the conveniency "combined" format can be passed, refer to ElasticsearchServerless::API::Utils.bulkify documentation.
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/docs-bulk.html
      #
      def bulk(arguments = {})
        request_opts = { endpoint: arguments[:endpoint] || "bulk" }

        defined_params = [:index].inject({}) do |set_variables, variable|
          set_variables[variable] = arguments[variable] if arguments.key?(variable)
          set_variables
        end
        request_opts[:defined_params] = defined_params unless defined_params.empty?

        raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]

        arguments = arguments.clone
        headers = arguments.delete(:headers) || {}

        body = arguments.delete(:body)

        _index = arguments.delete(:index)

        method = ElasticsearchServerless::API::HTTP_POST
        path   = if _index
                   "#{Utils.listify(_index)}/_bulk"
                 else
                   "_bulk"
                 end
        params = Utils.process_params(arguments)

        if body.is_a? Array
          payload = ElasticsearchServerless::API::Utils.bulkify(body)
        else
          payload = body
        end

        headers.merge!("Content-Type" => "application/x-ndjson")
        ElasticsearchServerless::API::Response.new(
          perform_request(method, path, params, payload, headers, request_opts)
        )
      end
    end
  end
end

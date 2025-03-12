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
      # Get a document's source.
      # Get the source of a document.
      # For example:
      # +
      # GET my-index-000001/_source/1
      # +
      # You can use the source filtering parameters to control which parts of the +_source+ are returned:
      # +
      # GET my-index-000001/_source/1/?_source_includes=*.id&_source_excludes=entities
      # +
      #
      # @option arguments [String] :id A unique document identifier. (*Required*)
      # @option arguments [String] :index The name of the index that contains the document. (*Required*)
      # @option arguments [String] :preference The node or shard the operation should be performed on.
      #  By default, the operation is randomized between the shard replicas.
      # @option arguments [Boolean] :realtime If +true+, the request is real-time as opposed to near-real-time. Server default: true.
      # @option arguments [Boolean] :refresh If +true+, the request refreshes the relevant shards before retrieving the document.
      #  Setting it to +true+ should be done after careful thought and verification that this does not cause a heavy load on the system (and slow down indexing).
      # @option arguments [String] :routing A custom value used to route operations to a specific shard.
      # @option arguments [Boolean, String, Array<String>] :_source Indicates whether to return the +_source+ field (+true+ or +false+) or lists the fields to return.
      # @option arguments [String, Array<String>] :_source_excludes A comma-separated list of source fields to exclude in the response.
      # @option arguments [String, Array<String>] :_source_includes A comma-separated list of source fields to include in the response.
      # @option arguments [String, Array<String>] :stored_fields A comma-separated list of stored fields to return as part of a hit.
      # @option arguments [Integer] :version The version number for concurrency control.
      #  It must match the current version of the document for the request to succeed.
      # @option arguments [String] :version_type The version type.
      # @option arguments [Hash] :headers Custom HTTP headers
      #
      # @see https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-get
      #
      def get_source(arguments = {})
        request_opts = { endpoint: arguments[:endpoint] || 'get_source' }

        defined_params = [:index, :id].each_with_object({}) do |variable, set_variables|
          set_variables[variable] = arguments[variable] if arguments.key?(variable)
        end
        request_opts[:defined_params] = defined_params unless defined_params.empty?

        raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]
        raise ArgumentError, "Required argument 'id' missing" unless arguments[:id]

        arguments = arguments.clone
        headers = arguments.delete(:headers) || {}

        body = nil

        _id = arguments.delete(:id)

        _index = arguments.delete(:index)

        method = ElasticsearchServerless::API::HTTP_GET
        path   = "#{Utils.listify(_index)}/_source/#{Utils.listify(_id)}"
        params = Utils.process_params(arguments)

        ElasticsearchServerless::API::Response.new(
          perform_request(method, path, params, body, headers, request_opts)
        )
      end
    end
  end
end

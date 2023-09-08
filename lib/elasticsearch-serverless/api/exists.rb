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
      # Returns information about whether a document exists in an index.
      #
      # @option arguments [String] :id Identifier of the document. (*Required*)
      # @option arguments [String] :index Comma-separated list of data streams, indices, and aliases. Supports wildcards (+*+). (*Required*)
      # @option arguments [String] :preference Specifies the node or shard the operation should be performed on. Random by default.
      # @option arguments [Boolean] :realtime If +true+, the request is real-time as opposed to near-real-time. Server default: true.
      # @option arguments [Boolean] :refresh If +true+, Elasticsearch refreshes all shards involved in the delete by query after the request completes.
      # @option arguments [String] :routing Target the specified primary shard.
      # @option arguments [Boolean, String, Array<String>] :_source +true+ or +false+ to return the +_source+ field or not, or a list of fields to return.
      # @option arguments [String, Array<String>] :_source_excludes A comma-separated list of source fields to exclude in the response.
      # @option arguments [String, Array<String>] :_source_includes A comma-separated list of source fields to include in the response.
      # @option arguments [String, Array<String>] :stored_fields List of stored fields to return as part of a hit. If no fields are specified, no stored fields are included in the response. If this field is specified, the +_source+ parameter defaults to false.
      # @option arguments [Integer] :version Explicit version number for concurrency control. The specified version must match the current version of the document for the request to succeed.
      # @option arguments [String] :version_type Specific version type: +external+, +external_gte+.
      # @option arguments [Hash] :headers Custom HTTP headers
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-get.html
      #
      def exists(arguments = {})
        raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]
        raise ArgumentError, "Required argument 'id' missing" unless arguments[:id]

        arguments = arguments.clone
        headers = arguments.delete(:headers) || {}

        body = nil

        _id = arguments.delete(:id)

        _index = arguments.delete(:index)

        method = ElasticsearchServerless::API::HTTP_HEAD
        path   = "#{Utils.listify(_index)}/_doc/#{Utils.listify(_id)}"
        params = Utils.process_params(arguments)

        Utils.rescue_from_not_found do
          perform_request(method, path, params, body, headers).status == 200 ? true : false
        end
      end

      alias_method :exists?, :exists
    end
  end
end

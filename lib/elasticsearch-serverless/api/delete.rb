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
      # Removes a JSON document from the specified index.
      #
      # @option arguments [String] :id Unique identifier for the document. (*Required*)
      # @option arguments [String] :index Name of the target index. (*Required*)
      # @option arguments [Integer] :if_primary_term Only perform the operation if the document has this primary term.
      # @option arguments [Integer] :if_seq_no Only perform the operation if the document has this sequence number.
      # @option arguments [String] :refresh If +true+, Elasticsearch refreshes the affected shards to make this operation visible to search, if +wait_for+ then wait for a refresh to make this operation visible to search, if +false+ do nothing with refreshes. Valid values: +true+, +false+, +wait_for+. Server default: false.
      # @option arguments [String] :routing Custom value used to route operations to a specific shard.
      # @option arguments [Time] :timeout Period to wait for active shards. Server default: 1m.
      # @option arguments [Integer] :version Explicit version number for concurrency control. The specified version must match the current version of the document for the request to succeed.
      # @option arguments [String] :version_type Specific version type: +external+, +external_gte+.
      # @option arguments [Integer, String] :wait_for_active_shards The number of shard copies that must be active before proceeding with the operation. Set to +all+ or any positive integer up to the total number of shards in the index (+number_of_replicas+1+). Server default: 1.
      # @option arguments [Hash] :headers Custom HTTP headers
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-delete.html
      #
      def delete(arguments = {})
        raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]
        raise ArgumentError, "Required argument 'id' missing" unless arguments[:id]

        arguments = arguments.clone
        headers = arguments.delete(:headers) || {}

        body = nil

        _id = arguments.delete(:id)

        _index = arguments.delete(:index)

        method = ElasticsearchServerless::API::HTTP_DELETE
        path   = "#{Utils.listify(_index)}/_doc/#{Utils.listify(_id)}"
        params = Utils.process_params(arguments)

        if Array(arguments[:ignore]).include?(404)
          Utils.rescue_from_not_found {
            ElasticsearchServerless::API::Response.new(
              perform_request(method, path, params, body, headers)
            )
          }
        else
          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end

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
      # Allows to get multiple documents in one request.
      #
      # @option arguments [String] :index Name of the index to retrieve documents from when +ids+ are specified, or when a document in the +docs+ array does not specify an index.
      # @option arguments [String] :preference Specifies the node or shard the operation should be performed on. Random by default.
      # @option arguments [Boolean] :realtime If +true+, the request is real-time as opposed to near-real-time. Server default: true.
      # @option arguments [Boolean] :refresh If +true+, the request refreshes relevant shards before retrieving documents.
      # @option arguments [String] :routing Custom value used to route operations to a specific shard.
      # @option arguments [Boolean, String, Array<String>] :_source True or false to return the +_source+ field or not, or a list of fields to return.
      # @option arguments [String, Array<String>] :_source_excludes A comma-separated list of source fields to exclude from the response. You can also use this parameter to exclude fields from the subset specified in +_source_includes+ query parameter.
      # @option arguments [String, Array<String>] :_source_includes A comma-separated list of source fields to include in the response. If this parameter is specified, only these source fields are returned. You can exclude fields from this subset using the +_source_excludes+ query parameter. If the +_source+ parameter is +false+, this parameter is ignored.
      # @option arguments [String, Array<String>] :stored_fields If +true+, retrieves the document fields stored in the index rather than the document +_source+. Server default: false.
      # @option arguments [Hash] :headers Custom HTTP headers
      # @option arguments [Hash] :body request body
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-multi-get.html
      #
      def mget(arguments = {})
        raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]

        arguments = arguments.clone
        headers = arguments.delete(:headers) || {}

        body = arguments.delete(:body)

        _index = arguments.delete(:index)

        method = ElasticsearchServerless::API::HTTP_POST
        path   = if _index
                   "#{Utils.listify(_index)}/_mget"
                 else
                   "_mget"
                 end
        params = Utils.process_params(arguments)

        ElasticsearchServerless::API::Response.new(
          perform_request(method, path, params, body, headers)
        )
      end
    end
  end
end

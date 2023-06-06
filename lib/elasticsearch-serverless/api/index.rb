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
# Auto generated from commit
# @see https://github.com/elastic/elasticsearch-specification
#
module ElasticsearchServerless
  module API
    module Actions
      # Creates or updates a document in an index.
      #
      # @option arguments [String] :id Document ID
      # @option arguments [String] :index The name of the index (*Required*)
      # @option arguments [Number] :if_primary_term only perform the index operation if the last operation that has changed the document has the specified primary term
      # @option arguments [Long] :if_seq_no only perform the index operation if the last operation that has changed the document has the specified sequence number
      # @option arguments [String] :op_type Explicit operation type. Defaults to `index` for requests with an explicit document ID, and to `create`for requests without an explicit document ID
      # @option arguments [String] :pipeline The pipeline id to preprocess incoming documents with
      # @option arguments [String] :refresh If `true` then refresh the affected shards to make this operation visible to search, if `wait_for` then wait for a refresh to make this operation visible to search, if `false` (the default) then do nothing with refreshes.
      # @option arguments [String] :routing Specific routing value
      # @option arguments [String] :timeout Explicit operation timeout
      # @option arguments [Long] :version Explicit version number for concurrency control
      # @option arguments [String] :version_type Specific version type
      # @option arguments [String] :wait_for_active_shards Sets the number of shard copies that must be active before proceeding with the index operation. Defaults to 1, meaning the primary shard only. Set to `all` for all shard copies, otherwise set to any non-negative value less than or equal to the total number of copies for the shard (number of replicas + 1)
      # @option arguments [Boolean] :require_alias When true, requires destination to be an alias. Default is false
      # @option arguments [Hash] :headers Custom HTTP headers
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-index_.html
      #
      def index(arguments = {})
        raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]
        raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]

        arguments = arguments.clone
        headers = arguments.delete(:headers) || {}

        body = arguments.delete(:body)

        _id = arguments.delete(:id)

        _index = arguments.delete(:index)

        method = _id ? ElasticsearchServerless::API::HTTP_PUT : ElasticsearchServerless::API::HTTP_POST
        path   = if _index && _id
                   "#{Utils.listify(_index)}/_doc/#{Utils.listify(_id)}"
                 else
                   "#{Utils.listify(_index)}/_doc"
                 end
        params = Utils.process_params(arguments)

        ElasticsearchServerless::API::Response.new(
          perform_request(method, path, params, body, headers)
        )
      end
    end
  end
end

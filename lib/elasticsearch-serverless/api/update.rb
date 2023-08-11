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
      # Updates a document with a script or partial document.
      #
      # @option arguments [String] :id Document ID (*Required*)
      # @option arguments [String] :index The name of the index (*Required*)
      # @option arguments [Integer] :if_primary_term Only perform the operation if the document has this primary term.
      # @option arguments [Integer] :if_seq_no Only perform the operation if the document has this sequence number.
      # @option arguments [String] :lang The script language. Server default: painless.
      # @option arguments [String] :refresh If 'true', Elasticsearch refreshes the affected shards to make this operation visible to search, if 'wait_for' then wait for a refresh to make this operation visible to search, if 'false' do nothing with refreshes. Server default: false.
      # @option arguments [Boolean] :require_alias If true, the destination must be an index alias.
      # @option arguments [Integer] :retry_on_conflict Specify how many times should the operation be retried when a conflict occurs. Server default: 0.
      # @option arguments [String] :routing Custom value used to route operations to a specific shard.
      # @option arguments [Time] :timeout Period to wait for dynamic mapping updates and active shards. This guarantees Elasticsearch waits for at least the timeout before failing. The actual wait time could be longer, particularly when multiple waits occur. Server default: 1m.
      # @option arguments [Integer, String] :wait_for_active_shards The number of shard copies that must be active before proceeding with the operations. Set to 'all' or any positive integer up to the total number of shards in the index (number_of_replicas+1). Defaults to 1 meaning the primary shard. Server default: 1.
      # @option arguments [Boolean, String, Array<String>] :_source Set to false to disable source retrieval. You can also specify a comma-separated list of the fields you want to retrieve. Server default: true.
      # @option arguments [String, Array<String>] :_source_excludes Specify the source fields you want to exclude.
      # @option arguments [String, Array<String>] :_source_includes Specify the source fields you want to retrieve.
      # @option arguments [Hash] :headers Custom HTTP headers
      # @option arguments [Hash] :body request body
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-update.html
      #
      def update(arguments = {})
        raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]
        raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]
        raise ArgumentError, "Required argument 'id' missing" unless arguments[:id]

        arguments = arguments.clone
        headers = arguments.delete(:headers) || {}

        body = arguments.delete(:body)

        _id = arguments.delete(:id)

        _index = arguments.delete(:index)

        method = ElasticsearchServerless::API::HTTP_POST
        path   = "#{Utils.listify(_index)}/_update/#{Utils.listify(_id)}"
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

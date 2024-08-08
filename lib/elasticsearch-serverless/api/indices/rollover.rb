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
    module Indices
      module Actions
        # Roll over to a new index.
        # Creates a new index for a data stream or index alias.
        #
        # @option arguments [String] :alias Name of the data stream or index alias to roll over. (*Required*)
        # @option arguments [String] :new_index Name of the index to create.
        #  Supports date math.
        #  Data streams do not support this parameter.
        # @option arguments [Boolean] :dry_run If +true+, checks whether the current index satisfies the specified conditions but does not perform a rollover.
        # @option arguments [Time] :master_timeout Period to wait for a connection to the master node.
        #  If no response is received before the timeout expires, the request fails and returns an error. Server default: 30s.
        # @option arguments [Time] :timeout Period to wait for a response.
        #  If no response is received before the timeout expires, the request fails and returns an error. Server default: 30s.
        # @option arguments [Integer, String] :wait_for_active_shards The number of shard copies that must be active before proceeding with the operation.
        #  Set to all or any positive integer up to the total number of shards in the index (+number_of_replicas+1+). Server default: 1.
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body request body
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-rollover-index.html
        #
        def rollover(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || "indices.rollover" }

          defined_params = [:alias, :new_index].inject({}) do |set_variables, variable|
            set_variables[variable] = arguments[variable] if arguments.key?(variable)
            set_variables
          end
          request_opts[:defined_params] = defined_params unless defined_params.empty?

          raise ArgumentError, "Required argument 'alias' missing" unless arguments[:alias]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          _alias = arguments.delete(:alias)

          _new_index = arguments.delete(:new_index)

          method = ElasticsearchServerless::API::HTTP_POST
          path   = if _alias && _new_index
                     "#{Utils.listify(_alias)}/_rollover/#{Utils.listify(_new_index)}"
                   else
                     "#{Utils.listify(_alias)}/_rollover"
                   end
          params = Utils.process_params(arguments)

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end

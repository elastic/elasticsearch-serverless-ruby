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
        # Changes a dynamic index setting in real time. For data streams, index setting
        # changes are applied to all backing indices by default.
        #
        # @option arguments [String, Array] :index Comma-separated list of data streams, indices, and aliases used to limit the request. Supports wildcards (+*+). To target all data streams and indices, omit this parameter or use +*+ or +_all+.
        # @option arguments [Boolean] :allow_no_indices If +false+, the request returns an error if any wildcard expression, index alias, or +_all+ value targets only missing or closed indices. This behavior applies even if the request targets other open indices. For example, a request targeting +foo*,bar*+ returns an error if an index starts with +foo+ but no index starts with +bar+.
        # @option arguments [String, Array<String>] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as +open,hidden+. Server default: open.
        # @option arguments [Boolean] :flat_settings If +true+, returns settings in flat format.
        # @option arguments [Boolean] :ignore_unavailable If +true+, returns settings in flat format.
        # @option arguments [Time] :master_timeout Period to wait for a connection to the master node. If no response is received before the timeout expires, the request fails and returns an error. Server default: 30s.
        # @option arguments [Boolean] :preserve_existing If +true+, existing index settings remain unchanged.
        # @option arguments [Time] :timeout Period to wait for a response. If no response is received before the  timeout expires, the request fails and returns an error. Server default: 30s.
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body settings
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-update-settings.html
        #
        def put_settings(arguments = {})
          raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          _index = arguments.delete(:index)

          method = ElasticsearchServerless::API::HTTP_PUT
          path   = if _index
                     "#{Utils.listify(_index)}/_settings"
                   else
                     "_settings"
                   end
          params = Utils.process_params(arguments)

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end

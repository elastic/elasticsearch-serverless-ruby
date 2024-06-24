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
        # Returns information about one or more indices. For data streams, the API returns information about the
        # stream’s backing indices.
        #
        # @option arguments [String, Array] :index Comma-separated list of data streams, indices, and index aliases used to limit the request. Wildcard expressions (*) are supported. (*Required*)
        # @option arguments [Boolean] :allow_no_indices If false, the request returns an error if any wildcard expression, index alias, or _all value targets only missing or closed indices. This behavior applies even if the request targets other open indices. For example, a request targeting foo*,bar* returns an error if an index starts with foo but no index starts with bar. Server default: true.
        # @option arguments [String, Array<String>] :expand_wildcards Type of index that wildcard expressions can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as open,hidden. Server default: open.
        # @option arguments [Boolean] :flat_settings If true, returns settings in flat format.
        # @option arguments [Boolean] :ignore_unavailable If false, requests that target a missing index return an error.
        # @option arguments [Boolean] :include_defaults If true, return all default settings in the response.
        # @option arguments [Boolean] :local If true, the request retrieves information from the local node only. Defaults to false, which means information is retrieved from the master node.
        # @option arguments [Time] :master_timeout Period to wait for a connection to the master node. If no response is received before the timeout expires, the request fails and returns an error. Server default: 30s.
        # @option arguments [String, Array<String>] :features Return only information on specified index features Server default: ['aliases', 'mappings', 'settings'].
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-get-index.html
        #
        def get(arguments = {})
          raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _index = arguments.delete(:index)

          method = ElasticsearchServerless::API::HTTP_GET
          path   = "#{Utils.listify(_index)}"
          params = Utils.process_params(arguments)

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end

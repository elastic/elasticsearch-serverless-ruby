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
    module License
      module Actions
        # Get license information.
        # Get information about your Elastic license including its type, its status, when it was issued, and when it expires.
        # NOTE: If the master node is generating a new cluster state, the get license API may return a +404 Not Found+ response.
        # If you receive an unexpected 404 response after cluster startup, wait a short period and retry the request.
        #
        # @option arguments [Boolean] :accept_enterprise If +true+, this parameter returns enterprise for Enterprise license types. If +false+, this parameter returns platinum for both platinum and enterprise license types. This behavior is maintained for backwards compatibility.
        #  This parameter is deprecated and will always be set to true in 8.x. Server default: true.
        # @option arguments [Boolean] :local Specifies whether to retrieve local information. The default value is +false+, which means the information is retrieved from the master node.
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/get-license.html
        #
        def get(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || "license.get" }

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          method = ElasticsearchServerless::API::HTTP_GET
          path   = "_license"
          params = Utils.process_params(arguments)

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end

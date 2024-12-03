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
    module Security
      module Actions
        # Update an API key.
        # Updates attributes of an existing API key.
        # Users can only update API keys that they created or that were granted to them.
        # Use this API to update API keys created by the create API Key or grant API Key APIs.
        # If you need to apply the same update to many API keys, you can use bulk update API Keys to reduce overhead.
        # It’s not possible to update expired API keys, or API keys that have been invalidated by invalidate API Key.
        # This API supports updates to an API key’s access scope and metadata.
        # The access scope of an API key is derived from the +role_descriptors+ you specify in the request, and a snapshot of the owner user’s permissions at the time of the request.
        # The snapshot of the owner’s permissions is updated automatically on every call.
        # If you don’t specify +role_descriptors+ in the request, a call to this API might still change the API key’s access scope.
        # This change can occur if the owner user’s permissions have changed since the API key was created or last modified.
        # To update another user’s API key, use the +run_as+ feature to submit a request on behalf of another user.
        # IMPORTANT: It’s not possible to use an API key as the authentication credential for this API.
        # To update an API key, the owner user’s credentials are required.
        #
        # @option arguments [String] :id The ID of the API key to update. (*Required*)
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body request body
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-update-api-key.html
        #
        def update_api_key(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || "security.update_api_key" }

          defined_params = [:id].inject({}) do |set_variables, variable|
            set_variables[variable] = arguments[variable] if arguments.key?(variable)
            set_variables
          end
          request_opts[:defined_params] = defined_params unless defined_params.empty?

          raise ArgumentError, "Required argument 'id' missing" unless arguments[:id]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          _id = arguments.delete(:id)

          method = ElasticsearchServerless::API::HTTP_PUT
          path   = "_security/api_key/#{Utils.listify(_id)}"
          params = {}

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end

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
        # Invalidates one or more API keys.
        # The +manage_api_key+ privilege allows deleting any API keys.
        # The +manage_own_api_key+ only allows deleting API keys that are owned by the user.
        # In addition, with the +manage_own_api_key+ privilege, an invalidation request must be issued in one of the three formats:
        # - Set the parameter +owner=true+.
        # - Or, set both +username+ and +realm_name+ to match the user’s identity.
        # - Or, if the request is issued by an API key, i.e. an API key invalidates itself, specify its ID in the +ids+ field.
        #
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body request body
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-invalidate-api-key.html
        #
        def invalidate_api_key(arguments = {})
          raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          method = ElasticsearchServerless::API::HTTP_DELETE
          path   = "_security/api_key"
          params = {}

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end

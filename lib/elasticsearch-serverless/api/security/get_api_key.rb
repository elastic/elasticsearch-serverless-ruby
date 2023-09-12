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
        # Retrieves information for one or more API keys.
        #
        # @option arguments [String] :id An API key id. This parameter cannot be used with any of +name+, +realm_name+ or +username+.
        # @option arguments [String] :name An API key name. This parameter cannot be used with any of +id+, +realm_name+ or +username+. It supports prefix search with wildcard.
        # @option arguments [Boolean] :owner A boolean flag that can be used to query API keys owned by the currently authenticated user. The +realm_name+ or +username+ parameters cannot be specified when this parameter is set to +true+ as they are assumed to be the currently authenticated ones.
        # @option arguments [String] :realm_name The name of an authentication realm. This parameter cannot be used with either +id+ or +name+ or when +owner+ flag is set to +true+.
        # @option arguments [String] :username The username of a user. This parameter cannot be used with either +id+ or +name+ or when +owner+ flag is set to +true+.
        # @option arguments [Boolean] :with_limited_by Return the snapshot of the owner user's role descriptors associated with the API key. An API key's actual permission is the intersection of its assigned role descriptors and the owner user's role descriptors.
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-get-api-key.html
        #
        def get_api_key(arguments = {})
          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          method = ElasticsearchServerless::API::HTTP_GET
          path   = "_security/api_key"
          params = Utils.process_params(arguments)

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end

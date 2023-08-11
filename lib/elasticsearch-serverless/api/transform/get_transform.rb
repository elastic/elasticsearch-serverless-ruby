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
    module Transform
      module Actions
        # Retrieves configuration information for transforms.
        #
        # @option arguments [String, Array<String>] :transform_id Identifier for the transform. It can be a transform identifier or a wildcard expression. You can get information for all transforms by using +_all+, by specifying +*+ as the +<transform_id>+, or by omitting the +<transform_id>+.
        # @option arguments [Boolean] :allow_no_match Specifies what to do when the request:  1. Contains wildcard expressions and there are no transforms that match. 2. Contains the _all string or no identifiers and there are no matches. 3. Contains wildcard expressions and there are only partial matches.  If this parameter is false, the request returns a 404 status code when there are no matches or only partial matches. Server default: true.
        # @option arguments [Integer] :from Skips the specified number of transforms. Server default: 0.
        # @option arguments [Integer] :size Specifies the maximum number of transforms to obtain. Server default: 100.
        # @option arguments [Boolean] :exclude_generated Excludes fields that were automatically added when creating the transform. This allows the configuration to be in an acceptable format to be retrieved and then added to another cluster.
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/get-transform.html
        #
        def get_transform(arguments = {})
          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _transform_id = arguments.delete(:transform_id)

          method = ElasticsearchServerless::API::HTTP_GET
          path   = if _transform_id
                     "_transform/#{Utils.listify(_transform_id)}"
                   else
                     "_transform"
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

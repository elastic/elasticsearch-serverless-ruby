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
    module MachineLearning
      module Actions
        # Previews a datafeed.
        #
        # @option arguments [String] :datafeed_id A numerical character string that uniquely identifies the datafeed. This identifier can contain lowercase alphanumeric characters (a-z and 0-9), hyphens, and underscores. It must start and end with alphanumeric characters. NOTE: If you use this path parameter, you cannot provide datafeed or anomaly detection job configuration details in the request body.
        # @option arguments [String, Time] :start The start time from where the datafeed preview should begin
        # @option arguments [String, Time] :end The end time when the datafeed preview should stop
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body request body
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-preview-datafeed.html
        #
        def preview_datafeed(arguments = {})
          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          _datafeed_id = arguments.delete(:datafeed_id)

          method = if body
                     ElasticsearchServerless::API::HTTP_POST
                   else
                     ElasticsearchServerless::API::HTTP_GET
                   end

          path   = if _datafeed_id
                     "_ml/datafeeds/#{Utils.listify(_datafeed_id)}/_preview"
                   else
                     "_ml/datafeeds/_preview"
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

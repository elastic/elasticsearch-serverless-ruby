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
        # Preview features used by data frame analytics.
        # Preview the extracted features used by a data frame analytics config.
        #
        # @option arguments [String] :id Identifier for the data frame analytics job.
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body request body
        #
        # @see https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-ml-preview-data-frame-analytics
        #
        def preview_data_frame_analytics(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || 'ml.preview_data_frame_analytics' }

          defined_params = [:id].each_with_object({}) do |variable, set_variables|
            set_variables[variable] = arguments[variable] if arguments.key?(variable)
          end
          request_opts[:defined_params] = defined_params unless defined_params.empty?

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          _id = arguments.delete(:id)

          method = if body
                     ElasticsearchServerless::API::HTTP_POST
                   else
                     ElasticsearchServerless::API::HTTP_GET
                   end

          path   = if _id
                     "_ml/data_frame/analytics/#{Utils.listify(_id)}/_preview"
                   else
                     '_ml/data_frame/analytics/_preview'
                   end
          params = {}

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end

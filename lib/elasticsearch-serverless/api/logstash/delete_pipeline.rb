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
    module Logstash
      module Actions
        # Delete a Logstash pipeline.
        # Delete a pipeline that is used for Logstash Central Management.
        #
        # @option arguments [String] :id An identifier for the pipeline. (*Required*)
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/logstash-api-delete-pipeline.html
        #
        def delete_pipeline(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || "logstash.delete_pipeline" }

          defined_params = [:id].inject({}) do |set_variables, variable|
            set_variables[variable] = arguments[variable] if arguments.key?(variable)
            set_variables
          end
          request_opts[:defined_params] = defined_params unless defined_params.empty?

          raise ArgumentError, "Required argument 'id' missing" unless arguments[:id]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _id = arguments.delete(:id)

          method = ElasticsearchServerless::API::HTTP_DELETE
          path   = "_logstash/pipeline/#{Utils.listify(_id)}"
          params = {}

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end

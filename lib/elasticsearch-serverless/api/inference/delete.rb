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
    module Inference
      module Actions
        # Delete an inference endpoint
        # This functionality is Experimental and may be changed or removed
        # completely in a future release. Elastic will take a best effort approach
        # to fix any issues, but experimental features are not subject to the
        # support SLA of official GA features.
        #
        # @option arguments [String] :task_type The task type
        # @option arguments [String] :inference_id The inference Id (*Required*)
        # @option arguments [Boolean] :dry_run When true, the endpoint is not deleted, and a list of ingest processors which reference this endpoint is returned
        # @option arguments [Boolean] :force When true, the inference endpoint is forcefully deleted even if it is still being used by ingest processors or semantic text fields
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/delete-inference-api.html
        #
        def delete(arguments = {})
          raise ArgumentError, "Required argument 'inference_id' missing" unless arguments[:inference_id]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _task_type = arguments.delete(:task_type)

          _inference_id = arguments.delete(:inference_id)

          method = ElasticsearchServerless::API::HTTP_DELETE
          path   = if _task_type && _inference_id
                     "_inference/#{Utils.listify(_task_type)}/#{Utils.listify(_inference_id)}"
                   else
                     "_inference/#{Utils.listify(_inference_id)}"
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

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
    module Connector
      module Actions
        # Deletes a connector sync job.
        # This functionality is in Beta and is subject to change. The design and
        # code is less mature than official GA features and is being provided
        # as-is with no warranties. Beta features are not subject to the support
        # SLA of official GA features.
        #
        # @option arguments [String] :connector_sync_job_id The unique identifier of the connector sync job to be deleted (*Required*)
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/delete-connector-sync-job-api.html
        #
        def sync_job_delete(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || "connector.sync_job_delete" }

          defined_params = [:connector_sync_job_id].inject({}) do |set_variables, variable|
            set_variables[variable] = arguments[variable] if arguments.key?(variable)
            set_variables
          end
          request_opts[:defined_params] = defined_params unless defined_params.empty?

          raise ArgumentError,
                "Required argument 'connector_sync_job_id' missing" unless arguments[:connector_sync_job_id]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _connector_sync_job_id = arguments.delete(:connector_sync_job_id)

          method = ElasticsearchServerless::API::HTTP_DELETE
          path   = "_connector/_sync_job/#{Utils.listify(_connector_sync_job_id)}"
          params = {}

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end

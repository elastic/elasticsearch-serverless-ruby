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
        # Deletes a connector.
        # This functionality is in Beta and is subject to change. The design and
        # code is less mature than official GA features and is being provided
        # as-is with no warranties. Beta features are not subject to the support
        # SLA of official GA features.
        #
        # @option arguments [String] :connector_id The unique identifier of the connector to be deleted (*Required*)
        # @option arguments [Boolean] :delete_sync_jobs Determines whether associated sync jobs are also deleted. (*Required*)
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/delete-connector-api.html
        #
        def delete(arguments = {})
          raise ArgumentError, "Required argument 'connector_id' missing" unless arguments[:connector_id]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _connector_id = arguments.delete(:connector_id)

          method = ElasticsearchServerless::API::HTTP_DELETE
          path   = "_connector/#{Utils.listify(_connector_id)}"
          params = Utils.process_params(arguments)

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end
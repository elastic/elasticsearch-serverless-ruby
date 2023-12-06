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
    module Indices
      module Actions
        # Simulate resolving the given template name or body
        #
        # @option arguments [String] :name Name of the index template to simulate. To test a template configuration before you add it to the cluster, omit this parameter and specify the template configuration in the request body.
        # @option arguments [Boolean] :create If true, the template passed in the body is only used if no existing templates match the same index patterns. If false, the simulation uses the template with the highest priority. Note that the template is not permanently added or updated in either case; it is only used for the simulation.
        # @option arguments [Time] :master_timeout Period to wait for a connection to the master node. If no response is received before the timeout expires, the request fails and returns an error. Server default: 30s.
        # @option arguments [Boolean] :include_defaults If true, returns all relevant default configurations for the index template.
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body template
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-simulate-template.html
        #
        def simulate_template(arguments = {})
          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          _name = arguments.delete(:name)

          method = ElasticsearchServerless::API::HTTP_POST
          path   = if _name
                     "_index_template/_simulate/#{Utils.listify(_name)}"
                   else
                     "_index_template/_simulate"
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

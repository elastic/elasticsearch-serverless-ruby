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
    module Actions
      # Returns multiple termvectors in one request.
      #
      # @option arguments [String] :index Name of the index that contains the documents.
      # @option arguments [Array<String>] :ids A comma-separated list of documents ids. You must define ids as parameter or set "ids" or "docs" in the request body
      # @option arguments [String, Array<String>] :fields Comma-separated list or wildcard expressions of fields to include in the statistics.
      #  Used as the default list unless a specific field list is provided in the +completion_fields+ or +fielddata_fields+ parameters.
      # @option arguments [Boolean] :field_statistics If +true+, the response includes the document count, sum of document frequencies, and sum of total term frequencies. Server default: true.
      # @option arguments [Boolean] :offsets If +true+, the response includes term offsets. Server default: true.
      # @option arguments [Boolean] :payloads If +true+, the response includes term payloads. Server default: true.
      # @option arguments [Boolean] :positions If +true+, the response includes term positions. Server default: true.
      # @option arguments [String] :preference Specifies the node or shard the operation should be performed on.
      #  Random by default.
      # @option arguments [Boolean] :realtime If true, the request is real-time as opposed to near-real-time. Server default: true.
      # @option arguments [String] :routing Custom value used to route operations to a specific shard.
      # @option arguments [Boolean] :term_statistics If true, the response includes term frequency and document frequency.
      # @option arguments [Integer] :version If +true+, returns the document version as part of a hit.
      # @option arguments [String] :version_type Specific version type.
      # @option arguments [Hash] :headers Custom HTTP headers
      # @option arguments [Hash] :body request body
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-multi-termvectors.html
      #
      def mtermvectors(arguments = {})
        request_opts = { endpoint: arguments[:endpoint] || "mtermvectors" }

        defined_params = [:index].inject({}) do |set_variables, variable|
          set_variables[variable] = arguments[variable] if arguments.key?(variable)
          set_variables
        end
        request_opts[:defined_params] = defined_params unless defined_params.empty?

        arguments = arguments.clone
        headers = arguments.delete(:headers) || {}

        body = arguments.delete(:body)

        _index = arguments.delete(:index)

        method = if body
                   ElasticsearchServerless::API::HTTP_POST
                 else
                   ElasticsearchServerless::API::HTTP_GET
                 end

        path   = if _index
                   "#{Utils.listify(_index)}/_mtermvectors"
                 else
                   "_mtermvectors"
                 end
        params = Utils.process_params(arguments)

        ElasticsearchServerless::API::Response.new(
          perform_request(method, path, params, body, headers, request_opts)
        )
      end
    end
  end
end

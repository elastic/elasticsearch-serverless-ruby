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
      # Runs multiple templated searches with a single request.
      #
      # @option arguments [String, Array] :index Comma-separated list of data streams, indices, and aliases to search.
      #  Supports wildcards (+*+).
      #  To search all data streams and indices, omit this parameter or use +*+.
      # @option arguments [Boolean] :ccs_minimize_roundtrips If +true+, network round-trips are minimized for cross-cluster search requests. Server default: true.
      # @option arguments [Integer] :max_concurrent_searches Maximum number of concurrent searches the API can run.
      # @option arguments [String] :search_type The type of the search operation.
      #  Available options: +query_then_fetch+, +dfs_query_then_fetch+.
      # @option arguments [Boolean] :rest_total_hits_as_int If +true+, the response returns +hits.total+ as an integer.
      #  If +false+, it returns +hits.total+ as an object.
      # @option arguments [Boolean] :typed_keys If +true+, the response prefixes aggregation and suggester names with their respective types.
      # @option arguments [Hash] :headers Custom HTTP headers
      # @option arguments [Hash] :body search_templates
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/search-multi-search.html
      #
      def msearch_template(arguments = {})
        request_opts = { endpoint: arguments[:endpoint] || "msearch_template" }

        defined_params = [:index].inject({}) do |set_variables, variable|
          set_variables[variable] = arguments[variable] if arguments.key?(variable)
          set_variables
        end
        request_opts[:defined_params] = defined_params unless defined_params.empty?

        raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]

        arguments = arguments.clone
        headers = arguments.delete(:headers) || {}

        body = arguments.delete(:body)

        _index = arguments.delete(:index)

        method = ElasticsearchServerless::API::HTTP_POST
        path   = if _index
                   "#{Utils.listify(_index)}/_msearch/template"
                 else
                   "_msearch/template"
                 end
        params = Utils.process_params(arguments)

        case
        when body.is_a?(Array)
          payload = body.map { |d| d.is_a?(String) ? d : ElasticsearchServerless::API.serializer.dump(d) }
          payload << "" unless payload.empty?
          payload = payload.join("
")
        else
          payload = body
        end

        headers.merge!("Content-Type" => "application/x-ndjson")
        ElasticsearchServerless::API::Response.new(
          perform_request(method, path, params, payload, headers, request_opts)
        )
      end
    end
  end
end

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
      # Clears the search context and results for a scrolling search.
      #
      # @option arguments [String, Array] :scroll_id Comma-separated list of scroll IDs to clear.
      #  To clear all scroll IDs, use +_all+.
      # @option arguments [Hash] :headers Custom HTTP headers
      # @option arguments [Hash] :body request body
      #
      # *Deprecation notice*:
      # A scroll id can be quite large and should be specified as part of the body
      # Deprecated since version 7.0.0
      #
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/clear-scroll-api.html
      #
      def clear_scroll(arguments = {})
        request_opts = { endpoint: arguments[:endpoint] || "clear_scroll" }

        defined_params = [:scroll_id].inject({}) do |set_variables, variable|
          set_variables[variable] = arguments[variable] if arguments.key?(variable)
          set_variables
        end
        request_opts[:defined_params] = defined_params unless defined_params.empty?

        arguments = arguments.clone
        headers = arguments.delete(:headers) || {}

        body = arguments.delete(:body)

        _scroll_id = arguments.delete(:scroll_id)

        method = ElasticsearchServerless::API::HTTP_DELETE
        path   = if _scroll_id
                   "_search/scroll/#{Utils.listify(_scroll_id)}"
                 else
                   "_search/scroll"
                 end
        params = Utils.process_params(arguments)

        if Array(arguments[:ignore]).include?(404)
          Utils.rescue_from_not_found {
            ElasticsearchServerless::API::Response.new(
              perform_request(method, path, params, body, headers, request_opts)
            )
          }
        else
          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end

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
      # Renders a search template as a search request body.
      #
      # @option arguments [String] :id ID of the search template to render.
      #  If no +source+ is specified, this or the +id+ request body parameter is required.
      # @option arguments [Hash] :headers Custom HTTP headers
      # @option arguments [Hash] :body request body
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/render-search-template-api.html
      #
      def render_search_template(arguments = {})
        request_opts = { endpoint: arguments[:endpoint] || "render_search_template" }

        defined_params = [:id].inject({}) do |set_variables, variable|
          set_variables[variable] = arguments[variable] if arguments.key?(variable)
          set_variables
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
                   "_render/template/#{Utils.listify(_id)}"
                 else
                   "_render/template"
                 end
        params = {}

        ElasticsearchServerless::API::Response.new(
          perform_request(method, path, params, body, headers, request_opts)
        )
      end
    end
  end
end

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
      # Run a script.
      # Runs a script and returns a result.
      # Use this API to build and test scripts, such as when defining a script for a runtime field.
      # This API requires very few dependencies and is especially useful if you don't have permissions to write documents on a cluster.
      # The API uses several _contexts_, which control how scripts are run, what variables are available at runtime, and what the return type is.
      # Each context requires a script, but additional parameters depend on the context you're using for that script.
      # This functionality is Experimental and may be changed or removed
      # completely in a future release. Elastic will take a best effort approach
      # to fix any issues, but experimental features are not subject to the
      # support SLA of official GA features.
      #
      # @option arguments [Hash] :headers Custom HTTP headers
      # @option arguments [Hash] :body request body
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/painless/current/painless-execute-api.html
      #
      def scripts_painless_execute(arguments = {})
        request_opts = { endpoint: arguments[:endpoint] || 'scripts_painless_execute' }

        arguments = arguments.clone
        headers = arguments.delete(:headers) || {}

        body = arguments.delete(:body)

        method = if body
                   ElasticsearchServerless::API::HTTP_POST
                 else
                   ElasticsearchServerless::API::HTTP_GET
                 end

        path   = '_scripts/painless/_execute'
        params = {}

        ElasticsearchServerless::API::Response.new(
          perform_request(method, path, params, body, headers, request_opts)
        )
      end
    end
  end
end

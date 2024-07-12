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
    module SearchApplication
      module Actions
        # Returns the existing search applications.
        # This functionality is in Beta and is subject to change. The design and
        # code is less mature than official GA features and is being provided
        # as-is with no warranties. Beta features are not subject to the support
        # SLA of official GA features.
        #
        # @option arguments [String] :q Query in the Lucene query string syntax.
        # @option arguments [Integer] :from Starting offset. Server default: 0.
        # @option arguments [Integer] :size Specifies a max number of results to get.
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/list-search-applications.html
        #
        def list(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || "search_application.list" }

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          method = ElasticsearchServerless::API::HTTP_GET
          path   = "_application/search_application"
          params = Utils.process_params(arguments)

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end

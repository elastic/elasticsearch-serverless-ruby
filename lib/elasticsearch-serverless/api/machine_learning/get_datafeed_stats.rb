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
    module MachineLearning
      module Actions
        # Retrieves usage information for datafeeds.
        #
        # @option arguments [String, Array] :datafeed_id Identifier for the datafeed. It can be a datafeed identifier or a wildcard expression. If you do not specify one of these options, the API returns information about all datafeeds.
        # @option arguments [Boolean] :allow_no_match Specifies what to do when the request:  1. Contains wildcard expressions and there are no datafeeds that match. 2. Contains the +_all+ string or no identifiers and there are no matches. 3. Contains wildcard expressions and there are only partial matches.  The default value is +true+, which returns an empty +datafeeds+ array when there are no matches and the subset of results when there are partial matches. If this parameter is +false+, the request returns a +404+ status code when there are no matches or only partial matches.
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-get-datafeed-stats.html
        #
        def get_datafeed_stats(arguments = {})
          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _datafeed_id = arguments.delete(:datafeed_id)

          method = ElasticsearchServerless::API::HTTP_GET
          path   = if _datafeed_id
                     "_ml/datafeeds/#{Utils.listify(_datafeed_id)}/_stats"
                   else
                     "_ml/datafeeds/_stats"
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

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
        # Retrieves statistics for one or more data streams.
        #
        # @option arguments [String] :name Comma-separated list of data streams used to limit the request. Wildcard expressions (+*+) are supported. To target all data streams in a cluster, omit this parameter or use +*+.
        # @option arguments [String, Array<String>] :expand_wildcards Type of data stream that wildcard patterns can match. Supports comma-separated values, such as +open,hidden+. Server default: open.
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams.html
        #
        def data_streams_stats(arguments = {})
          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _name = arguments.delete(:name)

          method = ElasticsearchServerless::API::HTTP_GET
          path   = if _name
                     "_data_stream/#{Utils.listify(_name)}/_stats"
                   else
                     "_data_stream/_stats"
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

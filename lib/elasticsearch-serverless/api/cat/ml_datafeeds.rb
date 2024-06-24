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
    module Cat
      module Actions
        # Returns configuration and usage information about datafeeds.
        # This API returns a maximum of 10,000 datafeeds.
        # If the Elasticsearch security features are enabled, you must have `monitor_ml`, `monitor`, `manage_ml`, or `manage`
        # cluster privileges to use this API.
        #
        # IMPORTANT: cat APIs are only intended for human consumption using the Kibana
        # console or command line. They are not intended for use by applications. For
        # application consumption, use the get datafeed statistics API.
        #
        # @option arguments [String] :datafeed_id A numerical character string that uniquely identifies the datafeed.
        # @option arguments [Boolean] :allow_no_match Specifies what to do when the request:  * Contains wildcard expressions and there are no datafeeds that match. * Contains the +_all+ string or no identifiers and there are no matches. * Contains wildcard expressions and there are only partial matches.  If +true+, the API returns an empty datafeeds array when there are no matches and the subset of results when there are partial matches. If +false+, the API returns a 404 status code when there are no matches or only partial matches. Server default: true.
        # @option arguments [String, Array<String>] :h Comma-separated list of column names to display. Server default: ['bc', 'id', 'sc', 's'].
        # @option arguments [String, Array<String>] :s Comma-separated list of column names or column aliases used to sort the response.
        # @option arguments [String] :time The unit used to display time values.
        # @option arguments [String] :format Specifies the format to return the columnar data in, can be set to +text+, +json+, +cbor+, +yaml+, or +smile+. Server default: text.
        # @option arguments [String, Array<String>] :h List of columns to appear in the response. Supports simple wildcards.
        # @option arguments [Boolean] :help When set to +true+ will output available columns. This option can't be combined with any other query string option.
        # @option arguments [Boolean] :local If +true+, the request computes the list of selected nodes from the local cluster state. If +false+ the list of selected nodes are computed from the cluster state of the master node. In both cases the coordinating node will send requests for further information to each selected node.
        # @option arguments [Time] :master_timeout Period to wait for a connection to the master node. Server default: 30s.
        # @option arguments [String, Array<String>] :s List of columns that determine how the table should be sorted. Sorting defaults to ascending and can be changed by setting +:asc+ or +:desc+ as a suffix to the column name.
        # @option arguments [Boolean] :v When set to +true+ will enable verbose output.
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-datafeeds.html
        #
        def ml_datafeeds(arguments = {})
          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _datafeed_id = arguments.delete(:datafeed_id)

          method = ElasticsearchServerless::API::HTTP_GET
          path   = if _datafeed_id
                     "_cat/ml/datafeeds/#{Utils.listify(_datafeed_id)}"
                   else
                     "_cat/ml/datafeeds"
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

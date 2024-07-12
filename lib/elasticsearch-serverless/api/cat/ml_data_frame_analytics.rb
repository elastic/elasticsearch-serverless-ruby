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
        # Returns configuration and usage information about data frame analytics jobs.
        #
        # IMPORTANT: cat APIs are only intended for human consumption using the Kibana
        # console or command line. They are not intended for use by applications. For
        # application consumption, use the get data frame analytics jobs statistics API.
        #
        # @option arguments [String] :id The ID of the data frame analytics to fetch
        # @option arguments [Boolean] :allow_no_match Whether to ignore if a wildcard expression matches no configs. (This includes +_all+ string or when no configs have been specified)
        # @option arguments [String] :bytes The unit in which to display byte values
        # @option arguments [String, Array<String>] :h Comma-separated list of column names to display. Server default: create_time,id,state,type.
        # @option arguments [String, Array<String>] :s Comma-separated list of column names or column aliases used to sort the response.
        # @option arguments [Time] :time Unit used to display time values.
        # @option arguments [String] :format Specifies the format to return the columnar data in, can be set to +text+, +json+, +cbor+, +yaml+, or +smile+. Server default: text.
        # @option arguments [String, Array<String>] :h List of columns to appear in the response. Supports simple wildcards.
        # @option arguments [Boolean] :help When set to +true+ will output available columns. This option can't be combined with any other query string option.
        # @option arguments [Boolean] :local If +true+, the request computes the list of selected nodes from the local cluster state. If +false+ the list of selected nodes are computed from the cluster state of the master node. In both cases the coordinating node will send requests for further information to each selected node.
        # @option arguments [Time] :master_timeout Period to wait for a connection to the master node. Server default: 30s.
        # @option arguments [String, Array<String>] :s List of columns that determine how the table should be sorted. Sorting defaults to ascending and can be changed by setting +:asc+ or +:desc+ as a suffix to the column name.
        # @option arguments [Boolean] :v When set to +true+ will enable verbose output.
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-dfanalytics.html
        #
        def ml_data_frame_analytics(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || "cat.ml_data_frame_analytics" }

          defined_params = [:id].inject({}) do |set_variables, variable|
            set_variables[variable] = arguments[variable] if arguments.key?(variable)
            set_variables
          end
          request_opts[:defined_params] = defined_params unless defined_params.empty?

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _id = arguments.delete(:id)

          method = ElasticsearchServerless::API::HTTP_GET
          path   = if _id
                     "_cat/ml/data_frame/analytics/#{Utils.listify(_id)}"
                   else
                     "_cat/ml/data_frame/analytics"
                   end
          params = Utils.process_params(arguments)

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end

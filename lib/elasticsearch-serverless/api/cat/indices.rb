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
        # Returns high-level information about indices in a cluster, including backing indices for data streams.
        # IMPORTANT: cat APIs are only intended for human consumption using the command line or Kibana console.
        # They are not intended for use by applications. For application consumption, use the get index API.
        # Use the cat indices API to get the following information for each index in a cluster: shard count; document count; deleted document count; primary store size; total store size of all shards, including shard replicas.
        # These metrics are retrieved directly from Lucene, which Elasticsearch uses internally to power indexing and search. As a result, all document counts include hidden nested documents.
        # To get an accurate count of Elasticsearch documents, use the cat count or count APIs.
        #
        # @option arguments [String, Array] :index Comma-separated list of data streams, indices, and aliases used to limit the request. Supports wildcards (+*+). To target all data streams and indices, omit this parameter or use +*+ or +_all+.
        # @option arguments [String] :bytes The unit used to display byte values.
        # @option arguments [String, Array<String>] :expand_wildcards The type of index that wildcard patterns can match.
        # @option arguments [String] :health The health status used to limit returned indices. By default, the response includes indices of any health status.
        # @option arguments [Boolean] :include_unloaded_segments If true, the response includes information from segments that are not loaded into memory.
        # @option arguments [Boolean] :pri If true, the response only includes information from primary shards.
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
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-indices.html
        #
        def indices(arguments = {})
          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _index = arguments.delete(:index)

          method = ElasticsearchServerless::API::HTTP_GET
          path   = if _index
                     "_cat/indices/#{Utils.listify(_index)}"
                   else
                     "_cat/indices"
                   end
          params = Utils.process_params(arguments)
          params[:h] = Utils.listify(params[:h]) if params[:h]

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end

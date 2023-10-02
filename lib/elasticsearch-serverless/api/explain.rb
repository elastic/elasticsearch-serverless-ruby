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
      # Returns information about why a specific matches (or doesn't match) a query.
      #
      # @option arguments [String] :id Defines the document ID. (*Required*)
      # @option arguments [String] :index Index names used to limit the request. Only a single index name can be provided to this parameter. (*Required*)
      # @option arguments [String] :analyzer Analyzer to use for the query string. This parameter can only be used when the +q+ query string parameter is specified.
      # @option arguments [Boolean] :analyze_wildcard If +true+, wildcard and prefix queries are analyzed.
      # @option arguments [String] :default_operator The default operator for query string query: +AND+ or +OR+. Server default: OR.
      # @option arguments [String] :df Field to use as default where no field prefix is given in the query string.
      # @option arguments [Boolean] :lenient If +true+, format-based query failures (such as providing text to a numeric field) in the query string will be ignored.
      # @option arguments [String] :preference Specifies the node or shard the operation should be performed on. Random by default.
      # @option arguments [String] :routing Custom value used to route operations to a specific shard.
      # @option arguments [Boolean, String, Array<String>] :_source True or false to return the +_source+ field or not, or a list of fields to return.
      # @option arguments [String, Array<String>] :_source_excludes A comma-separated list of source fields to exclude from the response.
      # @option arguments [String, Array<String>] :_source_includes A comma-separated list of source fields to include in the response.
      # @option arguments [String, Array<String>] :stored_fields A comma-separated list of stored fields to return in the response.
      # @option arguments [String] :q Query in the Lucene query string syntax.
      # @option arguments [Hash] :headers Custom HTTP headers
      # @option arguments [Hash] :body request body
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/search-explain.html
      #
      def explain(arguments = {})
        raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]
        raise ArgumentError, "Required argument 'id' missing" unless arguments[:id]

        arguments = arguments.clone
        headers = arguments.delete(:headers) || {}

        body = arguments.delete(:body)

        _id = arguments.delete(:id)

        _index = arguments.delete(:index)

        method = if body
                   ElasticsearchServerless::API::HTTP_POST
                 else
                   ElasticsearchServerless::API::HTTP_GET
                 end

        path   = "#{Utils.listify(_index)}/_explain/#{Utils.listify(_id)}"
        params = Utils.process_params(arguments)

        ElasticsearchServerless::API::Response.new(
          perform_request(method, path, params, body, headers)
        )
      end
    end
  end
end

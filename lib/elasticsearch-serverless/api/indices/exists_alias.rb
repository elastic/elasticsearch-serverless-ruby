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
        # Check aliases.
        # Checks if one or more data stream or index aliases exist.
        #
        # @option arguments [String, Array<String>] :name Comma-separated list of aliases to check. Supports wildcards (+*+). (*Required*)
        # @option arguments [String, Array] :index Comma-separated list of data streams or indices used to limit the request. Supports wildcards (+*+).
        #  To target all data streams and indices, omit this parameter or use +*+ or +_all+.
        # @option arguments [Boolean] :allow_no_indices If +false+, the request returns an error if any wildcard expression, index alias, or +_all+ value targets only missing or closed indices.
        #  This behavior applies even if the request targets other open indices. Server default: true.
        # @option arguments [String, Array<String>] :expand_wildcards Type of index that wildcard patterns can match.
        #  If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams.
        #  Supports comma-separated values, such as +open,hidden+.
        #  Valid values are: +all+, +open+, +closed+, +hidden+, +none+. Server default: open.
        # @option arguments [Boolean] :ignore_unavailable If +false+, requests that include a missing data stream or index in the target indices or data streams return an error.
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-aliases.html
        #
        def exists_alias(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || "indices.exists_alias" }

          defined_params = [:name, :index].inject({}) do |set_variables, variable|
            set_variables[variable] = arguments[variable] if arguments.key?(variable)
            set_variables
          end
          request_opts[:defined_params] = defined_params unless defined_params.empty?

          raise ArgumentError, "Required argument 'name' missing" unless arguments[:name]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _name = arguments.delete(:name)

          _index = arguments.delete(:index)

          method = ElasticsearchServerless::API::HTTP_HEAD
          path   = if _index && _name
                     "#{Utils.listify(_index)}/_alias/#{Utils.listify(_name)}"
                   else
                     "_alias/#{Utils.listify(_name)}"
                   end
          params = Utils.process_params(arguments)

          Utils.rescue_from_not_found do
            perform_request(method, path, params, body, headers, request_opts).status == 200 ? true : false
          end
        end

        alias_method :exists_alias?, :exists_alias
      end
    end
  end
end

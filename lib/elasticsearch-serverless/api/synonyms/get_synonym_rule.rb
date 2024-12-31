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
    module Synonyms
      module Actions
        # Get a synonym rule.
        # Get a synonym rule from a synonym set.
        #
        # @option arguments [String] :set_id The id of the synonym set to retrieve the synonym rule from (*Required*)
        # @option arguments [String] :rule_id The id of the synonym rule to retrieve (*Required*)
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/get-synonym-rule.html
        #
        def get_synonym_rule(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || "synonyms.get_synonym_rule" }

          defined_params = [:set_id, :rule_id].inject({}) do |set_variables, variable|
            set_variables[variable] = arguments[variable] if arguments.key?(variable)
            set_variables
          end
          request_opts[:defined_params] = defined_params unless defined_params.empty?

          raise ArgumentError, "Required argument 'set_id' missing" unless arguments[:set_id]
          raise ArgumentError, "Required argument 'rule_id' missing" unless arguments[:rule_id]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _set_id = arguments.delete(:set_id)

          _rule_id = arguments.delete(:rule_id)

          method = ElasticsearchServerless::API::HTTP_GET
          path   = "_synonyms/#{Utils.listify(_set_id)}/#{Utils.listify(_rule_id)}"
          params = {}

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end

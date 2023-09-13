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
    module Cluster
      module Actions
        # Creates or updates a component template
        #
        # @option arguments [String] :name Name of the component template to create. Elasticsearch includes the following built-in component templates: +logs-mappings+; 'logs-settings+; +metrics-mappings+; +metrics-settings+;+synthetics-mapping+; +synthetics-settings+. Elastic Agent uses these templates to configure backing indices for its data streams. If you use Elastic Agent and want to overwrite one of these templates, set the +version+ for your replacement template higher than the current version. If you don’t use Elastic Agent and want to disable all built-in component and index templates, set +stack.templates.enabled+ to +false+ using the cluster update settings API. (*Required*)
        # @option arguments [Boolean] :create If +true+, this request cannot replace or update existing component templates.
        # @option arguments [Time] :master_timeout Period to wait for a connection to the master node. If no response is received before the timeout expires, the request fails and returns an error. Server default: 30s.
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body request body
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-component-template.html
        #
        def put_component_template(arguments = {})
          raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]
          raise ArgumentError, "Required argument 'name' missing" unless arguments[:name]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          _name = arguments.delete(:name)

          method = ElasticsearchServerless::API::HTTP_PUT
          path   = "_component_template/#{Utils.listify(_name)}"
          params = Utils.process_params(arguments)

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end

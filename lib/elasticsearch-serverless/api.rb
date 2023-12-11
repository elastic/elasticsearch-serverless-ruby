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

require 'elasticsearch-serverless/api/response'
require 'elasticsearch-serverless/api/utils'

# Require everything in /api
Dir["#{File.dirname(__FILE__)}/api/**/*.rb"].each { |f| require f}

module ElasticsearchServerless
  module API
    include ElasticsearchServerless::API::Actions
    HTTP_GET    = 'GET'.freeze
    HTTP_HEAD   = 'HEAD'.freeze
    HTTP_POST   = 'POST'.freeze
    HTTP_PUT    = 'PUT'.freeze
    HTTP_DELETE = 'DELETE'.freeze

    # The serializer class
    #
    def self.serializer
      JSON
    end

    # Namespace definitions
    #
    # Shortcuts for namespaces allows using methods for namespaces:
    # +client.namespace.action+
    #
    module CommonClient
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def perform_request(method, path, params = {}, body = nil, headers = nil)
        client.perform_request method, path, params, body, headers
      end
    end

    # Add new namespaces to this constant
    #
    API_NAMESPACES = [
      :async_search,
      :cat,
      :cluster,
      :enrich,
      :eql,
      :graph,
      :indices,
      :ingest,
      :license,
      :logstash,
      :machine_learning,
      :query_ruleset,
      :search_application,
      :security,
      :sql,
      :synonyms,
      :transform
    ].freeze
    UPPERCASE_APIS = ['sql'].freeze

    API_NAMESPACES.each do |namespace|
      name = namespace.to_s
      module_name = if UPPERCASE_APIS.include?(name)
                      name.upcase
                    else
                      name.split("_").map(&:capitalize).join
                    end
      class_name = "#{module_name}Client"

      klass = Class.new(Object) do
        include CommonClient, Object.const_get("ElasticsearchServerless::API::#{module_name}::Actions")
      end
      Object.const_set(class_name, klass)
      define_method(name) do
        instance_variable_set("@#{name}", klass.new(self))
      end
    end
    # TODO: If there are more aliases, make this dynamic and add them to constant
    alias :ml :machine_learning
  end
end

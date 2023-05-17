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

require 'elastic/transport'
require 'elasticsearch-serverless/api'
require 'elasticsearch-serverless/version'

module ElasticsearchServerless
  class Client
    include ElasticsearchServerless::API

    # Initializes an Elasticsearch Serverless Client
    #
    # @param :api_key [String] Base64 String, format used to authenticate with Elasticsearch
    # @param :url [String] Elasticsearch endpoint
    # @param :arguments [Hash] Other optional arguments.
    # TODO: See which arguments we'll allow for Serverless.
    #
    def initialize(api_key:, url:, arguments: {})
      # TODO: Change this if we allow more arguments
      arguments.merge!(
        transport_options: { headers: { 'Authorization' => "ApiKey #{api_key}" } },
        host: url
      )
      @transport = Elastic::Transport::Client.new(arguments)
    end

    # Metaprogramming for integration with Transport
    def method_missing(name, *args, &block)
      if methods.include?(name)
        super
      else
        @transport.send(name, *args, &block)
      end
    end

    def respond_to_missing?(method_name, *args)
      @transport.respond_to?(method_name) || super
    end
  end
end

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

    VALID_PARAMETERS = [:adapter, :log, :logger, :serializer_class, :trace, :tracer, :headers]

    # Initializes an Elasticsearch Serverless Client
    #
    # @param :api_key [String] Base64 String, format used to authenticate with Elasticsearch
    # @param :url [String] Elasticsearch endpoint
    # @param :arguments [Hash] Other optional arguments.
    # @option arguments [Symbol] :adapter A specific adapter for Faraday (e.g. `:patron`)
    # @option arguments [Boolean] :log Use the default logger (disabled by default)
    # @option arguments [Object] :logger An instance of a Logger-compatible object
    # @option arguments [Boolean] :trace Use the default tracer (disabled by default)
    # @option arguments [Object] :tracer An instance of a Logger-compatible object
    # @option arguments [Constant] :serializer_class A specific serializer class to use, will be initialized by
    #                                                the transport and passed the transport instance
    # @option arguments [Hash] :headers Custom HTTP Request Headers
    #
    def initialize(api_key:, url:, arguments: {})
      validate_arguments(arguments)
      arguments.merge!(essential_parameters(url, api_key))
      @transport = Elastic::Transport::Client.new(arguments)
    end

    def essential_parameters(url, api_key)
      {
        host: url,
        transport_options: {
          headers: {
            'Authorization' => "ApiKey #{api_key}",
            'Elastic-Api-Version' => ElasticsearchServerless::API_VERSION,
            user_agent: user_agent
          },
        },
        compression: true
      }
    end

    def validate_arguments(arguments)
      arguments.map do |k, _|
        raise ArgumentError, "Parameter #{k}" unless VALID_PARAMETERS.include?(k)
      end
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

    def user_agent
      user_agent = [
        "elasticsearch-serverless-ruby/#{ElasticsearchServerless::VERSION}",
        "elastic-transport-ruby/#{Elastic::Transport::VERSION}",
        "RUBY_VERSION: #{RUBY_VERSION}"
      ]
      if RbConfig::CONFIG && RbConfig::CONFIG['host_os']
        user_agent << "#{RbConfig::CONFIG['host_os'].split('_').first[/[a-z]+/i].downcase} #{RbConfig::CONFIG['target_cpu']}"
      end
      user_agent.join("; ")
    end
  end
end

module Elastic
  # If the version is X.X.X.pre/alpha/beta, use X.X.Xp for the meta-header:
  def self.client_meta_version
    regexp = /^([0-9]+\.[0-9]+\.[0-9]+)\.?([a-z0-9.-]+)?$/
    match = ElasticsearchServerless::VERSION.match(regexp)
    return "#{match[1]}p" if match[2]

    ElasticsearchServerless::VERSION
  end

  ELASTICSEARCH_SERVICE_VERSION = [:esv, client_meta_version].freeze
end

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

require 'unit_test_helper'

describe ElasticsearchServerless::Client do
  context 'instantiation' do
    it 'raises an error when no url is passed' do
      expect{ ElasticsearchServerless::Client.new(api_key: 'test') }.
        to raise_error(ArgumentError, /missing keyword: :?url/)
    end

    it 'raises an error when no api_key is passed' do
      expect{ ElasticsearchServerless::Client.new(url: 'test') }.
        to raise_error(ArgumentError, /missing keyword: :?api_key/)
    end

    it 'instantiates a client' do
      expect(ElasticsearchServerless::Client.new(url: 'test', api_key: 'test')).
        to be_an_instance_of ElasticsearchServerless::Client
    end

    it 'integrates with Elastic Transport' do
      transport = double(Elastic::Transport::Client)
      allow(Elastic::Transport::Client).
        to receive(:new).with(
             {
               host: 'test',
               transport_options: {
                 headers: {
                   "Authorization" => "ApiKey test",
                   user_agent: ElasticsearchServerless::Client.new(url: 'test', api_key: 'test').user_agent
                 }
               },
               compression: true
             }
           ).and_return(transport)
      client = ElasticsearchServerless::Client.new(api_key: 'test', url: 'test')

      allow(transport).to receive(:perform_request).with('GET', '/')
      client.perform_request('GET', '/')
    end

    it 'uses the correct user agent' do
      client = ElasticsearchServerless::Client.new(api_key: 'test', url: 'test')
      expect(client.transport.options[:transport_options][:headers][:user_agent]).
        to match("elasticsearch-serverless-ruby/#{ElasticsearchServerless::VERSION}")
    end
  end

  context 'has compression enabled' do
    let(:client) do
      ElasticsearchServerless::Client.new(
        api_key: 'test',
        url: 'test'
      )
    end

    it 'has compression enabled' do
      expect(client.transport.options[:compression]).to eq true
    end
  end

  context 'initializer arguments' do
    let(:client) do
      ElasticsearchServerless::Client.new(api_key: 'test', url: 'test', arguments: arguments)
    end

    it 'raises an error for wrong parameters' do
      expect do
        ElasticsearchServerless::Client.new(api_key: 'test', url: 'test', randomize_hosts: true)
      end.to raise_error(ArgumentError)
    end

    it 'raises an error for wrong parameters in arguments' do
      expect do
        ElasticsearchServerless::Client.new(api_key: 'test', url: 'test', arguments: { randomize_hosts: true })
      end.to raise_error(ArgumentError)
    end

    context 'adapters' do
      let(:arguments) { { adapter: :net_http_persistent } }

      it 'accepts adapter as an argument' do
        require 'faraday/net_http_persistent'
        expect(client.transport.connections.first.connection.adapter).to eq Faraday::Adapter::NetHttpPersistent
      end
    end

    context 'log' do
      let(:arguments) { { log: true } }

      it 'accepts log as an argument' do
        expect(client.transport.options[:log]).to eq true
      end
    end

    context 'logger' do
      class MyLogger < Logger
        def initialize; end
      end
      let(:arguments) { { logger: MyLogger.new } }

      it 'accepts a logger as an argument' do
        expect(client.transport.options[:logger]).to be_an_instance_of(MyLogger)
      end
    end

    context 'trace' do
      let(:arguments) { { trace: true } }

      it 'accepts trace as an argument' do
        expect(client.transport.options[:trace]).to eq true
      end
    end

    context 'trace' do
      let(:arguments) { { tracer: MyLogger.new } }

      it 'accepts tracer as an argument' do
        expect(client.transport.options[:tracer]).to be_an_instance_of(MyLogger)
      end
    end

    context 'serializer_class' do
      class MyJSONSerializer
        def initialize(param); self end
      end
      let(:arguments) { { serializer_class: MyJSONSerializer } }

      it 'accepts a serializer_class as an argument' do
        expect(client.transport.options[:serializer_class]).to eq(MyJSONSerializer)
      end
    end
  end
end

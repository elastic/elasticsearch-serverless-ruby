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
  let(:client) do
    described_class.new(api_key: 'an_api_key', url: 'https://my-deployment.com')
  end
  let(:adapter_code) { "nh=#{defined?(Net::HTTP::VERSION) ? Net::HTTP::VERSION : Net::HTTP::HTTPVersion}" }
  let(:meta_version) { Elastic::client_meta_version }
  let(:meta_header) do
    if defined? JRUBY_VERSION
      "esv=#{meta_version},rb=#{RUBY_VERSION},t=#{Elastic::Transport::VERSION},jv=#{ENV_JAVA['java.version']},jr=#{JRUBY_VERSION},fd=#{Faraday::VERSION},#{adapter_code}"
    else
      "esv=#{meta_version},rb=#{RUBY_VERSION},t=#{Elastic::Transport::VERSION},fd=#{Faraday::VERSION},#{adapter_code}"
    end
  end

  let(:headers) do
    client.transport.connections.first.connection.headers
  end

  it 'formats the version for pre-releases' do
    stub_const('ElasticsearchServerless::CLIENT_VERSION', '1.0.0')
    stub_const('ElasticsearchServerless::VERSION', '1.0.0.pre')
    expect(meta_version).to eq '1.0.0p'
  end

  it 'doesnae change the version for normal releases' do
    stub_const('ElasticsearchServerless::CLIENT_VERSION', '1.0.0')
    stub_const('ElasticsearchServerless::VERSION', '1.0.0')
    expect(meta_version).to eq '1.0.0'
  end

  it 'formats the version with api date' do
    stub_const('ElasticsearchServerless::CLIENT_VERSION', '1.2.0')
    stub_const('ElasticsearchServerless::VERSION', '1.2.0.20231031.pre')
    expect(meta_version).to eq '1.2.0p'
  end

  it 'adds the meta header to the connection' do
    expect(headers).to include('x-elastic-client-meta' => meta_header)
  end
end

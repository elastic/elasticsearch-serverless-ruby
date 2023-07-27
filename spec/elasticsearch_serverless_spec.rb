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

require 'spec_helper'

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
               }
             }
           ).and_return(transport)
      client = ElasticsearchServerless::Client.new(api_key: 'test', url: 'test')

      allow(transport).to receive(:perform_request).with('GET', '/')
      client.perform_request('GET', '/')
    end
  end
end

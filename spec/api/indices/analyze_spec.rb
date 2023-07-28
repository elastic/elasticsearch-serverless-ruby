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
  context 'API:indices.analyze' do
    let(:client) do
      ElasticsearchServerless::Client.new(
        api_key: 'my_api_key',
        url: 'https://my-deployment.elastic.co'
      )
    end
    let(:index) { 'index-to-analyze' }
    let(:body) do
      {
        analyzer: "whitespace",
        text: "this is a test"
      }
    end

    before do
      VCR.use_cassette('indices.analyze.setup') do
        client.indices.create(index: index)
      end
    end

    after do
      VCR.use_cassette('indices.analyze.teardown') do
        client.indices.delete(index: index)
      end
    end

    context 'when an index is specified' do
      it 'performs the request' do
        VCR.use_cassette('indices.analyze') do
          response = client.indices.analyze(index: index, body: body)
          expect(response.status).to eq 200
          expect(response['tokens'].count).to eq 4
        end
      end
    end

    context 'when an index is not specified' do
      it 'performs the request' do
        VCR.use_cassette('indices.analyze.noindex') do
          response = client.indices.analyze(body: body)
          expect(response.status).to eq 200
          expect(response['tokens'].count).to eq 4
        end
      end
    end
  end
end

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
  context 'API:indices.delete' do
    let(:client) do
      ElasticsearchServerless::Client.new(
        api_key: 'my_api_key',
        url: 'https://my-deployment.elastic.co'
      )
    end
    let(:index) { 'index-to-delete' }

    it 'performs the request' do
      VCR.use_cassette('indices.delete') do
        response = client.indices.create(index: index)
        expect(response.status).to eq 200
        response = client.indices.delete(index: index)
        expect(response.status).to eq 200
        expect(response['acknowledged']).to eq true
      end
    end
  end
end

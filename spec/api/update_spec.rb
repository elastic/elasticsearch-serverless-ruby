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

describe 'API:update' do
  let(:client) do
    ElasticsearchServerless::Client.new(
      api_key: 'my_api_key',
      url: 'https://my-deployment.elastic.co'
    )
  end
  let(:index) { 'index-for-updates' }

  it 'performs the request' do
    VCR.use_cassette('update') do
      response = client.index(index: index, body: { name: 'Testing', description: 'To be updated' })
      expect(response.status).to eq 201
      id = response['_id']
      response = client.update(index: index, id: id, body: { doc: { description: 'Has been updated' } })
      expect(response.status).to eq 200
      expect(response['_id']).to eq id
      expect(response['_index']).to eq index
      expect(response['result']).to eq 'updated'
    end
  end
end

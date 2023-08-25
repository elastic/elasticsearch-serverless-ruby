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

describe 'API:mget' do
  let(:client) do
    ElasticsearchServerless::Client.new(
      api_key: 'my_api_key',
      url: 'https://my-deployment.elastic.co'
    )
  end
  let(:index) { 'mget_test' }

  before do
    VCR.use_cassette("#{index}_create") do
      client.indices.create(index: index)
      body = [
        { index: { _index: index, _id: '42' } },
        { name: 'Las lenguas de diamante', author: 'Juana de Ibarbourou', release_date: '1918-12-01', page_count: 108},
        { index: { _index: index, _id: '44' } },
        { name: 'Bestiario', author: 'Julio Cortazar', release_date: '1952-10-12', page_count: 133},
        { index: { _index: index, _id: '43' } },
        { name: 'Tales of love, madness and death', author: 'Horacio Quiroga', release_date: '1917-12-01', page_count: 188 }
      ]
      client.bulk(body: body, refresh: true)
    end
  end

  after do
    VCR.use_cassette("#{index}_delete") do
      client.indices.delete(index: index)
    end
  end

  it 'performs the request' do
    VCR.use_cassette("#{index}_perform") do
      response = client.mget(
        body: {
          docs: [
            { _index: index, _id: '42' },
            { _index: index, _id: '43' }
          ]
        }
      )
      expect(response.status).to eq 200
      expect(response['docs'].count).to eq 2
      expect(response['docs'].map { |a| a['_source']['author'] }).to eq ['Juana de Ibarbourou', 'Horacio Quiroga']
    end
  end
end

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

describe 'API:async_search' do
  let(:index) { 'async_search_test' }

  before do
    body = [
      { index: { _index: index, _id: '42' } },
      { name: 'Las lenguas de diamante', author: 'Juana de Ibarbourou', release_date: '1918-12-01', page_count: 108},
      { index: { _index: index, _id: '44' } },
      { name: 'Bestiario', author: 'Julio Cortazar', release_date: '1952-10-12', page_count: 133},
      { index: { _index: index, _id: '43' } },
      { name: 'Tales of love, madness and death', author: 'Horacio Quiroga', release_date: '1917-12-01', page_count: 188 }
    ]
    CLIENT.bulk(body: body, refresh: true)
  end

  after do
    CLIENT.indices.delete(index: index, ignore: 404)
  end

  it 'performs the request' do
    # Submit
    response = CLIENT.async_search.submit(index: index, q: 'julio', wait_for_completion_timeout: '0')
    id = response['id']
    expect(response.status).to eq 200
    expect(response['is_partial']).to eq true
    # Get
    response = CLIENT.async_search.get(id: id)
    expect(response.status).to eq 200
    expect(response['response']['hits']['hits'].count).to eq 1
    expect(response['response']['hits']['hits'].first['_source']['name']).to eq 'Bestiario'
    # Status
    response = CLIENT.async_search.status(id: id)
    expect(response.status).to eq 200
    # Delete
    response = CLIENT.async_search.delete(id: id)
    expect(response.status).to eq 200
    expect(response['acknowledged']).to be true
  end
end

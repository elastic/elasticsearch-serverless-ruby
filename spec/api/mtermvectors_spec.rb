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

describe 'API:mtermvectors' do
  let(:index) { 'mtermvectors' }

  before do
    CLIENT.indices.create(
      index: index,
      body: {
        mappings: { properties: { text: { type: 'text', term_vector: 'with_positions_offsets' } } }
      }
    )
    CLIENT.index(index: index, id: 'testing_document', body: { text: 'The quick brown fox is brown.' })
    CLIENT.indices.refresh
  end

  after do
    CLIENT.indices.delete(index: index)
  end

  it 'performs the request' do
    response = CLIENT.mtermvectors(
      term_statistics: true,
      body: { docs: [ {'_index' => index, '_id' => 'testing_document' } ] }
    )
    expect(response.status).to eq 200

    expect(response['docs'].first['term_vectors']['text']['terms']['brown']['term_freq']).to eq 2
    expect(response['docs'].first['term_vectors']['text']['terms']['brown']['ttf']).to eq 2
  end
end

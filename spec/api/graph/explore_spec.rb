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

describe 'API:graph.explore' do
  let(:index) { 'graph_explore_test' }

  before do
    CLIENT.indices.create(
      index: index,
      body: {
        mappings: {
          properties: { keys: { type: 'integer' } }
        }
      }
    )
    CLIENT.index(index: index, id: '1', body: { keys: [1,2,3] })
    CLIENT.index(index: index, id: '2', body: { keys: [4,5,6] })
    CLIENT.indices.refresh
  end

  after do
    CLIENT.indices.delete(index: index)
  end

  it 'performs the request' do
    body = {
      query: { match: { keys: 1 } },
      controls: { use_significance: false },
      vertices: [{ field: 'keys', min_doc_count: 1 }]
    }
    response = CLIENT.graph.explore(index: index, body: body)
    expect(response.status).to eq 200
    expect(response['failures'].count).to eq 0
    expect(response['vertices'].count).to eq 3
  end
end

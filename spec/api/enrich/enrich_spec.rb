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

describe 'API:enrich' do
  let(:index) { 'enrich' }
  let(:name) { 'policy-crud' }

  before do
    CLIENT.indices.create(
      index: index,
      body: {
        mappings: {
          properties: {
            baz: { type: 'keyword' },
            a: { type: 'keyword' },
            b: { type: 'keyword' }
          }
        }
      }
    )
  end

  after do
    CLIENT.indices.delete(index: index)
  end

  it 'puts, executes, gets, stats and deletes policy' do
    response = CLIENT.enrich.put_policy(
      name: name,
      body: {
        match: {
          indices: ["#{index}*"],
          match_field: 'baz',
          enrich_fields: ['a', 'b']
        }
      }
    )
    expect(response.status).to eq 200
    expect(response['acknowledged']).to eq true

    response = CLIENT.enrich.execute_policy(name: name)
    expect(response.status).to eq 200
    expect(response['status']['phase']).to eq 'COMPLETE'

    response = CLIENT.enrich.get_policy(name: name)
    expect(response.status).to eq 200
    expect(response['policies'].count).to eq 1
    expect(response['policies'].first['config']['match']['name']).to eq name

    response = CLIENT.enrich.stats
    expect(response.status).to eq 200
    expect(response['executing_policies'].count).to eq 0

    response = CLIENT.enrich.delete_policy(name: name)
    expect(response.status).to eq 200
    expect(response['acknowledged']).to eq true
  end
end

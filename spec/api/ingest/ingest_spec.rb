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

describe 'API:ingest' do
  let(:index) { 'eql_tests' }

  after do

  end

  it 'performs basic ingest requests' do
    # PUT
    response = CLIENT.ingest.put_pipeline(
      id: 'my_pipeline',
      body: {
        description: '_description',
        processors: []
      }
    )
    expect(response.status).to eq 200
    expect(response['acknowledged']).to eq true
    # GET
    response = CLIENT.ingest.get_pipeline(id: 'my_pipeline')
    expect(response.status).to eq 200
    expect(response['my_pipeline']['description']).to eq '_description'
    # SIMULATE
    response = CLIENT.ingest.simulate(
      id: 'my_pipeline',
      body: {
        docs: [
          {
            _index: "index",
            _id: "id",
            _source: {
              foo: "bar"
            }
          },
          {
            _index: "index",
            _id: "id",
            _source: {
              foo: "rab"
            }
          }
        ]
      }
    )
    expect(response.status).to eq 200
    # DELETE
    response = CLIENT.ingest.delete_pipeline(id: 'my_pipeline')
    expect(response.status).to eq 200
    expect(response['acknowledged']).to eq true
  end
end

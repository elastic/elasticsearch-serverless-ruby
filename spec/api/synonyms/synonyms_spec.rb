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

describe 'API:synonyms' do
  let(:index) { 'synonyms' }
  let(:id) { 'synonyms_id' }

  before do
    CLIENT.indices.create(index: index)
  end

  after do
    CLIENT.indices.delete(index: index)
  end

  it 'puts, gets, deletes synonyms' do
    response = CLIENT.synonyms.put_synonym(
      id: id,
      body: { synonyms_set: [ synonyms: 'house, home' ] }
    )
    expect(response.status).to eq 201
    expect(response['result']).to eq 'created'

    response = CLIENT.synonyms.get_synonym(id: id)
    expect(response.status).to eq 200

    response = CLIENT.synonyms.delete_synonym(id: id)
    expect(response.status).to eq 200
    expect(response['acknowledged']).to eq true
  end
end

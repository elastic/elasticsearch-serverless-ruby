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

describe 'API:create' do
  let(:index) { 'create' }

  before do
    VCR.use_cassette("#{index}_index") do
      CLIENT.indices.create(index: index)
    end
  end

  after do
    VCR.use_cassette("#{index}_delete") do
      CLIENT.indices.delete(index: index)
    end
  end

  it 'performs create' do
    VCR.use_cassette("#{index}_create") do
      doc = { name: 'testing create' }
      response = CLIENT.create(index: index, id: 42, body: doc)

      expect(response.status).to eq 201
      expect(response['_index']).to eq index
      expect(response['result']).to eq 'created'
    end
  end
end

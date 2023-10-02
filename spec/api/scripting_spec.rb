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

describe 'API:scripts' do
  let(:index) { 'script_index' }
  let(:id) { 'my-script' }

  before do
    VCR.use_cassette("#{index}_create") do
      CLIENT.indices.create(index: index)
      CLIENT.index(
        index: index,
        body: { name: 'test' },
        refresh: true
      )
    end
  end

  after do
    VCR.use_cassette("#{index}_delete") do
      CLIENT.indices.delete(index: index)
    end
  end

  it 'puts, gets and deletes a script' do
    VCR.use_cassette('scripting') do
      response = CLIENT.put_script(
        id: id,
        body: {
          script: {
            lang: 'painless',
            source: "Math.log(_score * 2)"
          }
        }
      )
      expect(response.status).to eq 200
      expect(response['acknowledged']).to eq true

      response = CLIENT.get_script(id: id)
      expect(response.status).to eq 200
      expect(response['_id']).to eq id
      expect(response['found']).to eq true

      response = CLIENT.delete_script(id: id)
      expect(response.status).to eq 200
      expect(response['acknowledged']).to eq true
    end
  end
end

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

describe 'API:indices.alias' do
  let(:index) { 'aliases_index' }
  let(:name) { 'my_alias' }

  before do
    VCR.use_cassette("#{index}_setup") do
      CLIENT.indices.create(index: index)
      CLIENT.indices.create(index: "#{index}2")
    end
  end

  after do
    VCR.use_cassette("#{index}_teardown") do
      CLIENT.indices.delete(index: index)
      CLIENT.indices.delete(index: "#{index}2")
    end
  end

  it 'creates, gets, exists, updates and deletes aliases' do
    VCR.use_cassette("#{index}_perform") do
      # CREATE Alias
      response = CLIENT.indices.put_alias(index: index, name: name)
      expect(response.status).to eq 200
      expect(response['acknowledged']).to eq true
      # GET Alias
      response = CLIENT.indices.get_alias(name: name)
      expect(response['aliases_index']['aliases']).to eq({ 'my_alias'=>{} })
      expect(response.status).to eq 200
      # EXISTS Alias
      response = CLIENT.indices.exists_alias(name: name)
      expect(response).to eq true
      # UPDATE Alias
      response = CLIENT.indices.update_aliases(
        body: {
          actions: [
            {
              add: {
                index: "#{index}2",
                'alias' => name
              }
            }
          ]
        }
      )
      expect(response.status).to eq 200
      expect(response['acknowledged']).to eq true
      # DELETE Alias
      response = CLIENT.indices.delete_alias(index: '*', name: name)
      expect(response.status).to eq 200
      expect(response['acknowledged']).to eq true
    end
  end
end

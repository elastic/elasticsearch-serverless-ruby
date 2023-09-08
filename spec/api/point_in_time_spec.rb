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

describe 'API:point_in_time' do
  let(:index) { 'point_in_time' }

  before do
    VCR.use_cassette("#{index}_create") do
      CLIENT.indices.create(index: index)
    end
  end

  after do
    VCR.use_cassette("#{index}_delete") do
      CLIENT.indices.delete(index: index)
    end
  end

  it 'opens a point in time, searches in it and closes it' do
    VCR.use_cassette('point_in_time_open') do
      response = CLIENT.open_point_in_time(index: index, keep_alive: '1m')
      expect(response.status).to eq 200
      id = response['id']
      response = CLIENT.search(
        body: { query: { match_all: {} }, pit: { id: id, keep_alive: '1m' } }
      )
      expect(response.status).to eq 200
      expect(response['pit_id']).to eq id
      response = CLIENT.close_point_in_time(body: {id: id})
      expect(response.status).to eq 200
      expect(response.body).to eq({ 'succeeded' => true, 'num_freed' => 1})
    end
  end
end

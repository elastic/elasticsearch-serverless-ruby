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

describe 'API:transform' do
  let(:index) { 'transforms' }
  let(:transform_id) { 'population' }

  before(:suite) do
    CLIENT.indices.create(index: index)
    CLIENT.bulk(
      body: [
        { index: { _index: index, _id: '1', data: { name: 'Africa', pop: 17.6} } },
        { index: { _index: index, _id: '2', data: { name: 'America', pop: 13 } } },
        { index: { _index: index, _id: '3', data: { name: 'Antarctica', pop: 0} } },
        { index: { _index: index, _id: '4', data: { name: 'Asia', pop: 59.4} } },
        { index: { _index: index, _id: '5', data: { name: 'Oceania', pop: 0.6} } },
        { index: { _index: index, _id: '6', data: { name: 'Europe', pop: 9.4} } }
      ],
      refresh: true
    )
  end

  after(:suite) do
    CLIENT.indices.delete(index: index)
    CLIENT.indices.delete(index: "#{index}_transformed")
  end

  context 'transform' do
    it 'put_transform' do
      response = CLIENT.transform.put_transform(
        transform_id: transform_id,
        body: {
          source: {
            index: index
          },
          dest: {
            index: "#{index}_transformed"
          },
          pivot: {
            group_by: { pop: { terms: { field: 'pop' } } },
            aggregations: { max_pop: { max: { field: 'pop' } } }
          }
        }
      )
      expect(response.status).to eq 200
      expect(response['acknowledged']).to be true
    end

    it 'update_transform' do
      response = CLIENT.transform.update_transform(
        transform_id: transform_id,
        body: { description: 'Continents aproximate population' }
      )
      expect(response.status).to eq 200
      expect(response['id']).to eq transform_id
    end

    it 'get_transform' do
      response = CLIENT.transform.get_transform(transform_id: transform_id)
      expect(response.status).to eq 200
      expect(response['count']).to eq 1
      expect(response['transforms'].first['id']).to eq transform_id
    end

    it 'get_transform_stats' do
      response = CLIENT.transform.get_transform_stats(transform_id: transform_id)
      expect(response.status).to eq 200
      expect(response['count']).to eq 1
      expect(response['transforms'].first['id']).to eq transform_id
      expect(response['transforms'].first['stats']).not_to be_empty
    end

    it 'preview_transform' do
      response = CLIENT.transform.preview_transform(transform_id: transform_id)
      expect(response.status).to eq 200
      expect(response['preview']).not_to be_empty
    end

    it 'start_transform' do
      response = CLIENT.transform.start_transform(transform_id: transform_id)
      expect(response.status).to eq 200
      expect(response['acknowledged']).to be true
    end

    it 'stop_transform' do
      response = CLIENT.transform.stop_transform(transform_id: transform_id)
      expect(response.status).to eq 200
      expect(response['acknowledged']).to be true
    end

    it 'reset_transform' do
      response = CLIENT.transform.reset_transform(transform_id: transform_id)
      expect(response.status).to eq 200
      expect(response['acknowledged']).to be true
    end

    it 'schedule_now_transform' do
      response = CLIENT.transform.schedule_now_transform(transform_id: transform_id)
      expect(response.status).to eq 200
      expect(response['acknowledged']).to be true
    end

    it 'delete_transform' do
      response = CLIENT.transform.delete_transform(transform_id: transform_id)
      expect(response.status).to eq 200
    end
  end
end

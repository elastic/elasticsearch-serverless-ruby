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
  let(:transformed_index) { 'transformed'}
  let(:transform_id) { 'population' }

  before do
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

  after do
    CLIENT.indices.delete(index: index)
  end

  context 'transform' do
    it 'put, update, get, get stats, preview, start, stop, reset, schedule, delete' do
      response = CLIENT.transform.put_transform(
        transform_id: transform_id,
        body: {
          source: {
            index: index
          },
          dest: {
            index: transformed_index
          },
          pivot: {
            group_by: { pop: { terms: { field: 'pop' } } },
            aggregations: { max_pop: { max: { field: 'pop' } } }
          }
        }
      )
      expect(response.status).to eq 200
      expect(response['acknowledged']).to be true

      # update_transform
      response = CLIENT.transform.update_transform(
        transform_id: transform_id,
        body: { description: 'Continents aproximate population' }
      )
      expect(response.status).to eq 200
      expect(response['id']).to eq transform_id

      # get_transform
      response = CLIENT.transform.get_transform(transform_id: transform_id)
      expect(response.status).to eq 200
      expect(response['count']).to eq 1
      expect(response['transforms'].first['id']).to eq transform_id

      # get_transform_stats
      response = CLIENT.transform.get_transform_stats(transform_id: transform_id)
      expect(response.status).to eq 200
      expect(response['count']).to eq 1
      expect(response['transforms'].first['id']).to eq transform_id
      expect(response['transforms'].first['stats']).not_to be_empty

      # preview_transform'
      response = CLIENT.transform.preview_transform(transform_id: transform_id)
      expect(response.status).to eq 200
      expect(response['preview']).not_to be_empty

      # start_transform
      response = CLIENT.transform.start_transform(transform_id: transform_id)
      expect(response.status).to eq 200
      expect(response['acknowledged']).to be true

      # stop_transform
      response = CLIENT.transform.stop_transform(transform_id: transform_id, wait_for_completion: true)
      expect(response.status).to eq 200
      expect(response['acknowledged']).to be true

      # reset_transform
      response = CLIENT.transform.reset_transform(transform_id: transform_id)
      expect(response.status).to eq 200
      expect(response['acknowledged']).to be true

      # schedule_now_transform
      response = CLIENT.transform.schedule_now_transform(transform_id: transform_id)
      expect(response.status).to eq 200
      expect(response['acknowledged']).to be true

      # delete_transform
      response = CLIENT.transform.delete_transform(transform_id: transform_id)
      expect(response.status).to eq 200
    end
  end
end

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

describe 'API:SQL' do
  let(:index) { 'sql_index' }
  let(:query) { "SELECT * FROM #{index} ORDER BY name" }
  let(:body) do
    [
      { index: { _index: index, _id: '42' } },
      { name: "The Hitchhiker's Guide to the Galaxy", author: 'Douglas Adams', release_date: '1979-10-12', page_count: 180},
      { index: { _index: index, _id: '43' } },
      { name: 'Snow Crash', author: 'Neal Stephenson', release_date: '1992-06-01', page_count: 470 },
      { index: { _index: index, _id: '44' } },
      { name: 'Starship Troopers', author: 'Robert A. Heinlein', release_date: '1959-12-01', page_count: 335}
    ]
  end

  context 'sync' do
    before do
      VCR.use_cassette("#{index}_create") do
        CLIENT.indices.create(index: index)
        CLIENT.bulk(body: body, refresh: true)
      end
    end

    after do
      VCR.use_cassette("#{index}_delete") do
        CLIENT.indices.delete(index: index)
      end
    end

    it 'queries, translates, clears cursor' do
      VCR.use_cassette("#{index}_perform") do
        response = CLIENT.sql.query(
          format: 'json',
          body: { query: query, fetch_size: 2 }
        )
        expect(response.status).to eq 200
        cursor = response['cursor']

        response = CLIENT.sql.translate(body: { query: query })
        expect(response.status).to eq 200

        response = CLIENT.sql.clear_cursor(body: { cursor: cursor })
        expect(response.status).to eq 200
        expect(response['succeeded']).to eq true
      end
    end
  end

  context 'Async' do
    before do
      VCR.use_cassette("#{index}_async_create") do
        CLIENT.indices.create(index: index)
        CLIENT.bulk(body: body, refresh: true)
      end
    end

    after do
      VCR.use_cassette("#{index}_async_delete") do
        CLIENT.indices.delete(index: index)
      end
    end

    it 'uses async SQL APIs' do
      VCR.use_cassette("#{index}_async") do
        # sql async search
        response = CLIENT.sql.query(
          format: 'json',
          body: {
            keep_alive: '1d',
            wait_for_completion_timeout: '0s',
            query: query,
            fetch_size: 1
          }
        )
        expect(response.status).to eq 200
        id = response['id']
        # get_async_status
        response = CLIENT.sql.get_async_status(id: id)
        expect(response.status).to eq 200
        # get_async
        response = CLIENT.sql.get_async(id: id)
        expect(response.status).to eq 200
        # delete_async
        response = CLIENT.sql.delete_async(id: id)
        expect(response.status).to eq 200
        expect(response['acknowledged']).to eq true
      end
    end
  end
end

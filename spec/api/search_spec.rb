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

describe 'API:search' do
  let(:client) do
    ElasticsearchServerless::Client.new(
      api_key: 'api_key',
      url: 'https://my-deployment.elastic.co'
    )
  end

  it 'performs the request' do
    VCR.use_cassette('search') do
      body = [
        { index: { _index: 'books', _id: '42' } },
        { name: "The Hitchhiker's Guide to the Galaxy", author: 'Douglas Adams', release_date: '1979-10-12', page_count: 180},
        { index: { _index: 'books', _id: '43' } },
        { name: 'Snow Crash', author: 'Neal Stephenson', release_date: '1992-06-01', page_count: 470 },
        { index: { _index: 'books', _id: '44' } },
        { name: 'Starship Troopers', author: 'Robert A. Heinlein', release_date: '1959-12-01', page_count: 335}
      ]
      client.bulk(body: body)
      response = client.search(index: 'books', q: 'snow')
      expect(response.status).to eq 200
      expect(response['hits']['hits'].first['_source']).to eq ({
                                                                 'name' => 'Snow Crash',
                                                                 'author' => 'Neal Stephenson',
                                                                 'release_date' => '1992-06-01',
                                                                 'page_count' => 470
                                                               })
    end
  end
end

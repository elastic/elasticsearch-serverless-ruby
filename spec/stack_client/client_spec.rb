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
require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'elasticsearch'
  gem 'rspec'
  gem 'vcr'
  gem 'debug'
end

require 'elasticsearch'
require 'rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/stack_client/fixtures/cassettes'
  config.hook_into :faraday
end

RSpec.configure do |config|
  config.formatter = 'documentation'
end

describe Elasticsearch::Client do
  let(:client) do
    Elasticsearch::Client.new(
      api_key: 'my_api_key',
      url: 'https://my-deployment.elastic.co'
    )
  end

  it 'gets an info response from Serverless' do
    VCR.use_cassette('stack_client_info') do
      response = client.info
      expect(response.status).to eq 200
      expect(response.body['name']).to eq 'serverless'
    end
  end

  it 'indexes and searches documents' do
    VCR.use_cassette('stack_client_index_and_search') do
      body = {
        name: "The Hitchhiker's Guide to the Galaxy",
        author: "Douglas Adams",
        release_date: "1979-10-12",
        page_count: 180
      }
      response = client.index(index: 'books', body: body)
      expect(response.status).to eq 201

      # Update a document
      book = { name: "Foundation", author: "Isaac Asimov", release_date: "1951-06-01", page_count: 224}
      response = client.index(index: 'books', body: book)
      expect(response.status).to eq 201
      id = response['_id']
      response = client.update(index: 'books', id: id, body: { doc: { page_count: 225 } })
      expect(response.status).to eq 200

      # Bulk index
      body = [
        { index: { _index: 'books', _id: '42' } },
        { name: "The Hitchhiker's Guide to the Galaxy", author: 'Douglas Adams', release_date: '1979-10-12', page_count: 180},
        { index: { _index: 'books', _id: '43' } },
        { name: 'Snow Crash', author: 'Neal Stephenson', release_date: '1992-06-01', page_count: 470 },
        { index: { _index: 'books', _id: '44' } },
        { name: 'Starship Troopers', author: 'Robert A. Heinlein', release_date: '1959-12-01', page_count: 335}
      ]
      response = client.bulk(body: body)
      expect(response.status).to eq 200

      # Bulk delete
      body = [
        { delete: { _index: 'books', _id: '42' } },
        { delete: { _index: 'books', _id: '43' } },
      ]
      response = client.bulk(body: body)
      expect(response.status).to eq 200
    end
  end

end

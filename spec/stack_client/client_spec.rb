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
  gem 'debug' unless defined?(JRUBY_VERSION)
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

  it 'searches' do
    VCR.use_cassette('stack_client_search') do
      body = [
        { index: { _index: 'books', data: {name: "Leviathan Wakes", "author": "James S.A. Corey", "release_date": "2011-06-02", "page_count": 561} } },
        { index: { _index: 'books', data: {name: "Hyperion", "author": "Dan Simmons", "release_date": "1989-05-26", "page_count": 482} } },
        { index: { _index: 'books', data: {name: "Dune", "author": "Frank Herbert", "release_date": "1965-06-01", "page_count": 604} } },
        { index: { _index: 'books', data: {name: "Dune Messiah", "author": "Frank Herbert", "release_date": "1969-10-15", "page_count": 331} } },
        { index: { _index: 'books', data: {name: "Children of Dune", "author": "Frank Herbert", "release_date": "1976-04-21", "page_count": 408} } },
        { index: { _index: 'books', data: {name: "God Emperor of Dune", "author": "Frank Herbert", "release_date": "1981-05-28", "page_count": 454} } },
        { index: { _index: 'books', data: {name: "Consider Phlebas", "author": "Iain M. Banks", "release_date": "1987-04-23", "page_count": 471} } },
        { index: { _index: 'books', data: {name: "Pandora's Star", "author": "Peter F. Hamilton", "release_date": "2004-03-02", "page_count": 768} } },
        { index: { _index: 'books', data: {name: "Revelation Space", "author": "Alastair Reynolds", "release_date": "2000-03-15", "page_count": 585} } },
        { index: { _index: 'books', data: {name: "A Fire Upon the Deep", "author": "Vernor Vinge", "release_date": "1992-06-01", "page_count": 613} } },
        { index: { _index: 'books', data: {name: "Ender's Game", "author": "Orson Scott Card", "release_date": "1985-06-01", "page_count": 324} } },
        { index: { _index: 'books', data: {name: "1984", "author": "George Orwell", "release_date": "1985-06-01", "page_count": 328} } },
        { index: { _index: 'books', data: {name: "Fahrenheit 451", "author": "Ray Bradbury", "release_date": "1953-10-15", "page_count": 227} } },
        { index: { _index: 'books', data: {name: "Brave New World", "author": "Aldous Huxley", "release_date": "1932-06-01", "page_count": 268} } },
        { index: { _index: 'books', data: {name: "Foundation", "author": "Isaac Asimov", "release_date": "1951-06-01", "page_count": 224} } },
        { index: { _index: 'books', data: {name: "The Giver", "author": "Lois Lowry", "release_date": "1993-04-26", "page_count": 208} } },
        { index: { _index: 'books', data: {name: "Slaughterhouse-Five", "author": "Kurt Vonnegut", "release_date": "1969-06-01", "page_count": 275} } },
        { index: { _index: 'books', data: {name: "The Hitchhiker's Guide to the Galaxy", "author": "Douglas Adams", "release_date": "1979-10-12", "page_count": 180} } },
        { index: { _index: 'books', data: {name: "Snow Crash", "author": "Neal Stephenson", "release_date": "1992-06-01", "page_count": 470} } },
        { index: { _index: 'books', data: {name: "Neuromancer", "author": "William Gibson", "release_date": "1984-07-01", "page_count": 271} } },
        { index: { _index: 'books', data: {name: "The Handmaid's Tale", "author": "Margaret Atwood", "release_date": "1985-06-01", "page_count": 311} } },
        { index: { _index: 'books', data: {name: "Starship Troopers", "author": "Robert A. Heinlein", "release_date": "1959-12-01", "page_count": 335} } },
        { index: { _index: 'books', data: {name: "The Left Hand of Darkness", "author": "Ursula K. Le Guin", "release_date": "1969-06-01", "page_count": 304} } },
        { index: { _index: 'books', data: {name: "The Moon is a Harsh Mistress", "author": "Robert A. Heinlein", "release_date": "1966-04-01", "page_count": 288 } } }
      ]
      response = client.bulk(body: body)
      expect(response.status).to eq 200

      response = client.search(index: 'books', q: 'dune', body: { fields: [{ field: 'name' }] })
      expect(response.status).to eq 200
      expect(response['hits']['hits'].count).to eq 4

      response = client.search(index: 'books', body: { size: 15 })
      expect(response.status).to eq 200
      expect(response['hits']['hits'].count).to eq 15
    end
  end

  it 'reindexes' do
    VCR.use_cassette('stack_client_reindex') do
      response = client.reindex(body: {source: { index: 'books' }, dest: { index: 'books-reindexed' } }, refresh: true)
      expect(response.status).to eq 200
      response = client.search(index: 'books-reindexed', body: { query: { match_all: {} } })
      expect(response.status).to eq 200
      expect(response['hits']['hits'].count).to eq 10
    end
  end
end

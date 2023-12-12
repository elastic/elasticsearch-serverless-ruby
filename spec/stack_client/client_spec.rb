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
  gem 'debug' unless defined?(JRUBY_VERSION)
end

require 'elasticsearch'
require 'rspec'

RSpec.configure do |config|
  config.formatter = 'documentation'
end

describe Elasticsearch::Client do
  let(:client) do
    Elasticsearch::Client.new(
      api_key: ENV['API_KEY'],
      url: ENV['ELASTICSEARCH_URL']
    )
  end

  after do
    client.indices.delete(index: index, ignore: 404)
  end

  let(:index) { 'bulk_books' }
  let(:books) do
    [
      { index: { _index: index, data: {name: "Leviathan Wakes", author: "James S.A. Corey", release_date: "2011-06-02", page_count: 561, id: 40 } } },
      { index: { _index: index, data: {name: "Hyperion", author: "Dan Simmons", release_date: "1989-05-26", page_count: 482, id: 41 } } },
      { index: { _index: index, data: {name: "Dune", author: "Frank Herbert", release_date: "1965-06-01", page_count: 604, id: 42 } } },
      { index: { _index: index, data: {name: "Dune Messiah", author: "Frank Herbert", release_date: "1969-10-15", page_count: 331, id: 43 } } },
      { index: { _index: index, data: {name: "Children of Dune", author: "Frank Herbert", release_date: "1976-04-21", page_count: 408, id: 44 } } },
      { index: { _index: index, data: {name: "God Emperor of Dune", author: "Frank Herbert", release_date: "1981-05-28", page_count: 454, id: 45 } } },
      { index: { _index: index, data: {name: "Consider Phlebas", author: "Iain M. Banks", release_date: "1987-04-23", page_count: 471, id: 46 } } },
      { index: { _index: index, data: {name: "Pandora's Star", author: "Peter F. Hamilton", release_date: "2004-03-02", page_count: 768, id: 47 } } },
      { index: { _index: index, data: {name: "Revelation Space", author: "Alastair Reynolds", release_date: "2000-03-15", page_count: 585, id: 48 } } },
      { index: { _index: index, data: {name: "A Fire Upon the Deep", author: "Vernor Vinge", release_date: "1992-06-01", page_count: 613, id: 49 } } },
      { index: { _index: index, data: {name: "Ender's Game", author: "Orson Scott Card", release_date: "1985-06-01", page_count: 324, id: 50 } } },
      { index: { _index: index, data: {name: "1984", author: "George Orwell", release_date: "1985-06-01", page_count: 328, id: 51 } } },
      { index: { _index: index, data: {name: "Fahrenheit 451", author: "Ray Bradbury", release_date: "1953-10-15", page_count: 227, id: 52 } } },
      { index: { _index: index, data: {name: "Brave New World", author: "Aldous Huxley", release_date: "1932-06-01", page_count: 268, id: 53 } } },
      { index: { _index: index, data: {name: "Foundation", author: "Isaac Asimov", release_date: "1951-06-01", page_count: 224, id: 54 } } },
      { index: { _index: index, data: {name: "The Giver", author: "Lois Lowry", release_date: "1993-04-26", page_count: 208, id: 55 } } },
      { index: { _index: index, data: {name: "Slaughterhouse-Five", author: "Kurt Vonnegut", release_date: "1969-06-01", page_count: 275, id: 56 } } },
      { index: { _index: index, data: {name: "The Hitchhiker's Guide to the Galaxy", author: "Douglas Adams", release_date: "1979-10-12", page_count: 180, id: 57 } } },
      { index: { _index: index, data: {name: "Snow Crash", author: "Neal Stephenson", release_date: "1992-06-01", page_count: 470, id: 58 } } },
      { index: { _index: index, data: {name: "Neuromancer", author: "William Gibson", release_date: "1984-07-01", page_count: 271, id: 59 } } },
      { index: { _index: index, data: {name: "The Handmaid's Tale", author: "Margaret Atwood", release_date: "1985-06-01", page_count: 311, id: 60 } } },
      { index: { _index: index, data: {name: "Starship Troopers", author: "Robert A. Heinlein", release_date: "1959-12-01", page_count: 335, id: 61 } } },
      { index: { _index: index, data: {name: "The Left Hand of Darkness", author: "Ursula K. Le Guin", release_date: "1969-06-01", page_count: 304, id: 62 } } },
      { index: { _index: index, data: {name: "The Moon is a Harsh Mistress", author: "Robert A. Heinlein", release_date: "1966-04-01", page_count: 288, id: 63 } } }
    ]
  end

  it 'gets an info response from Serverless' do
    response = client.info
    expect(response.status).to eq 200
    expect(response.body['name']).to eq 'serverless'
  end

  it 'indexes, updates, bulks documents' do
    body = {
      name: "The Hitchhiker's Guide to the Galaxy",
      author: "Douglas Adams",
      release_date: "1979-10-12",
      page_count: 180
    }
    response = client.index(index: index, body: body)
    expect(response.status).to eq 201

    # Update a document
    book = { name: "Foundation", author: "Isaac Asimov", release_date: "1951-06-01", page_count: 224}
    response = client.index(index: index, body: book)
    expect(response.status).to eq 201
    id = response['_id']
    response = client.update(index: index, id: id, body: { doc: { page_count: 225 } })
    expect(response.status).to eq 200

    # Bulk index
    response = client.bulk(body: books)
    expect(response.status).to eq 200

    # Bulk delete
    body = [
      { delete: { _index: index, _id: '59' } },
      { delete: { _index: index, _id: '56' } },
    ]
    response = client.bulk(body: body)
    expect(response.status).to eq 200
  end

  it 'searches' do
    response = client.bulk(body: books, refresh: true)
    expect(response.status).to eq 200

    response = client.search(index: index, q: 'dune')
    expect(response.status).to eq 200
    expect(response['hits']['hits'].count).to eq 4

    response = client.search(index: index, body: { size: 15 })
    expect(response.status).to eq 200
    expect(response['hits']['hits'].count).to eq 15
  end

  it 'reindexes' do
    client.bulk(body: books, refresh: true)
    response = client.reindex(body: {source: { index: index }, dest: { index: 'books-reindexed' } }, refresh: true)
    expect(response.status).to eq 200
    response = client.search(index: 'books-reindexed', body: { query: { match_all: {} } })
    expect(response.status).to eq 200
    expect(response['hits']['hits'].count).to eq 10
    client.indices.delete(index: 'books-reindexed')
  end
end

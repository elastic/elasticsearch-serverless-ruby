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

describe 'API:eql' do
  let(:index) { 'eql_tests' }

  before do
    CLIENT.indices.create(
      index: index,
      body: {
        mappings: {
          properties: {
            some_keyword: { type: 'keyword', ignore_above: 5 }
          },
          runtime: {
            day_of_week: {
              type: 'keyword',
              script: {
                source: "emit(doc['@timestamp'].value.dayOfWeekEnum.getDisplayName(TextStyle.FULL, Locale.ROOT))"
              }
            }
          }
        }
      }
    )
    CLIENT.bulk(
      refresh: true,
      body: [
        { index: { _index: index, _id: '1'} },
        {
          event: [category: 'process'],
          '@timestamp' => '2020-02-03T12:34:56Z',
          user: 'SYSTEM',
          id: 123,
          valid: false,
          some_keyword: 'longer than normal'
        },
        { index: { _index: index, _id: '2'} },
        {
          event: [category: 'process'],
          '@timestamp' => '2020-02-04T12:34:56Z',
          user: 'SYSTEM',
          id: 123,
          valid: true
        },
        { index: { _index: index, _id: '3'} },
        {
          event: [category: 'process'],
          '@timestamp' => '2020-02-05T12:34:56Z',
          user: 'SYSTEM',
          id: 123,
          valid: true
        },
        { index: { _index: index, _id: '4'} },
        {
          event: [category: 'network'],
          '@timestamp' => '2020-02-06T12:34:56Z',
          user: 'ADMIN',
          id: 123,
          valid: true
        },
        { index: { _index: index, _id: '5'} },
        {
          event: [category: 'network'],
          '@timestamp' => '2020-02-07T12:34:56Z',
          user: 'SYSTEM',
          id: 123,
          valid: true
        },
        { index: { _index: index, _id: '6'} },
        {
          event: [category: 'network'],
          '@timestamp' => '2020-02-08T12:34:56Z',
          user: 'ADMIN',
          id: 123,
          valid: true
        },
        { index: { _index: index, _id: '7'} },
        {
          event: [category: 'network'],
          '@timestamp' => '2020-02-09T12:34:56Z',
          user: 'SYSTEM',
          id: 123,
          valid: true
        }
      ]
    )
  end

  after do
    CLIENT.indices.delete(index: index)
  end

  it 'searches with EQL' do
    response = CLIENT.eql.search(
      index: index,
      body: {
        query: 'process where user == "SYSTEM"'
      },
      keep_on_completion: true,
      wait_for_completion_timeout: '0ms'
    )
    expect(response.status).to eq 200
    id = response['id']

    response = CLIENT.eql.get_status(id: id)
    expect(response.status).to eq 200
    expect(response['id']).to eq id

    response = CLIENT.eql.get(id: id)
    expect(response.status).to eq 200
    expect(response['timed_out']).to eq false
    expect(response['hits']['total']['value']).to eq 3
    expect(response['hits']['total']['relation']).to eq 'eq'

    response = CLIENT.eql.delete(id: id)
    expect(response.status).to eq 200
    expect(response['acknowledged']).to eq true
  end
end

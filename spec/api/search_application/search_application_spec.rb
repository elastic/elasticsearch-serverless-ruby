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

describe 'API:search_application' do
  let(:index) { 'search_application_test' }
  let(:name) { 'my-app' }

  before do
    CLIENT.indices.create(index: "#{index}1")
    CLIENT.indices.create(index: "#{index}2")
  end

  after do
    CLIENT.indices.delete(index: "#{index}1")
    CLIENT.indices.delete(index: "#{index}2")
  end

  it 'performs search_application requests' do
    body = {
      indices: [ "#{index}1", "#{index}2" ],
      template: {
        script: {
          source: {
            query: {
              query_string: {
                query: '{{query_string}}',
                default_field: '{{default_field}}'
              }
            }
          },
          params: {
            query_string: '*',
            default_field: '*'
          }
        },
        dictionary: {
          properties: {
            query_string: { type: 'string' },
            default_field: {
              type: 'string',
              enum: ['title', 'description']
            },
            additionalProperties: false
          },
          required: ['query_string']
        }
      }
    }

    response = CLIENT.search_application.put(
      name: name,
      body: body
    )
    expect([200,201]).to include response.status

    response = CLIENT.search_application.get(name: name)
    expect(response.status).to eq 200
    expect(response['name']).to eq name

    response = CLIENT.search_application.list
    expect(response.status).to eq 200
    expect(response['count']).to eq 1
    expect(response['results'].first['name']).to eq name

    response = CLIENT.search_application.search(
      name: name,
      body: {
        params: {
          default_field: 'title',
          query_string: 'test'
        }
      }
    )
    expect(response.status).to eq 200

    response = CLIENT.search_application.delete(name: name)
    expect(response.status).to eq 200
    expect(response['acknowledged']).to eq true
  end
end


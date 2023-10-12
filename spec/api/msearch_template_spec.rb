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

describe 'API:msearch_template' do
  let(:index) { 'msearch_template_test' }

  before do
    CLIENT.indices.create(index: index)
    CLIENT.put_script(
      id: 'my-search-template',
      body: {
        script: {
          lang: 'mustache',
          source: {
            query: {
              match: {
                message: '{{query_string}}'
              }
            },
            from: '{{from}}',
            size: '{{size}}'
          },
          params: {
            query_string: 'My query string'
          }
        }
      }
    )
  end

  after do
    CLIENT.indices.delete(index: index)
  end

  it 'performs the request' do
    response = CLIENT.msearch_template(
      index: index,
      body: [
        {},
        {
          id: 'my-search-template',
          params: {
            query_string: 'hello world',
            from: 0,
            size: 10
          }
        },
        {},
        {
          id: 'my-other-search-template',
          params: {
            query_type: 'match_all'
          }
        }
      ]
    )
    expect(response.status).to eq 200
    expect(response['responses'].map { |a| a['status'] }).to eq([200, 404])
  end
end

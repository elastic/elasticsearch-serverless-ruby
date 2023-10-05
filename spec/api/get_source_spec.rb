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

describe 'API:get_source' do
  let(:index) { 'get_source' }
  let(:id) do
    CLIENT.index(index: index, body: { name: 'testing' }, refresh: true)['_id']
  end

  after do
    CLIENT.indices.delete(index: index)
  end

  it 'performs request' do
    response = CLIENT.get_source(index: index, id: id)
    expect(response.status).to eq 200
    expect(response.body).to eq({ 'name' => 'testing' })
  end

  it 'returns a 404' do
    expect do
      CLIENT.exists_source(index: index, id: 'test')
    end.to raise_error Elastic::Transport::Transport::Errors::NotFound
  end
end

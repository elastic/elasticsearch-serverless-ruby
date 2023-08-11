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

describe 'API:indices.exists' do
  let(:client) do
    ElasticsearchServerless::Client.new(
      api_key: 'my_api_key',
      url: 'https://my-deployment.elastic.co'
    )
  end

  let(:index) { 'indices_exists' }

  before do
    VCR.use_cassette("#{index}_create") do
      client.indices.create(index: index)
    end
  end

  after do
    VCR.use_cassette("#{index}_delete") do
      client.indices.delete(index: index)
    end
  end

  it 'performs indices.exists' do
    VCR.use_cassette("#{index}_exists") do
      response = client.indices.exists(index: index)
      expect(response).to be true

      response = client.indices.exists?(index: index)
      expect(response).to be true
    end
  end
end

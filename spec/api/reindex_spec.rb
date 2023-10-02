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

describe 'API:reindex' do
  let(:index) { 'reindex_index' }

  before do
    VCR.use_cassette("#{index}_create") do
      CLIENT.indices.create(index: index)
      CLIENT.index(
        index: index,
        body: { name: 'garbanzo' },
        refresh: true
      )
    end
  end

  after do
    VCR.use_cassette("#{index}_delete") do
      CLIENT.indices.delete(index: index)
      CLIENT.indices.delete(index: "#{index}_reindexed")
    end
  end

  it 'performs the request' do
    VCR.use_cassette('reindex') do
      response = CLIENT.reindex(
        body: {
          source: {
            index: index
          },
          dest: {
            index: "#{index}_reindexed"
          }
        }
      )

      expect(response.status).to eq 200
      expect(response['created']).to eq 1
    end
  end
end

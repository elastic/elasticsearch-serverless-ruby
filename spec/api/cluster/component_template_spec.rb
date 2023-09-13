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

describe 'API:cluster.component_templates' do
  let(:name) { 'test_component_template' }
  it 'creates a component template' do
    body = {
      template: {
        mappings: {
          _source: { enabled: false },
          properties: {
            host_name: { type: "keyword" },
            created_at: { type: "date", format: "EEE MMM dd HH:mm:ss Z yyyy" }
          }
        }
      }
    }
    VCR.use_cassette('cluster.component_templates') do
      # PUT component template
      response = CLIENT.cluster.put_component_template(name: name, body: body)
      expect(response.status).to eq 200
      expect(response['acknowledged']).to be true

      # EXISTS component template
      response = CLIENT.cluster.exists_component_template(name: name)
      expect(response.status).to eq 200

      # Doesn't exist component template
      expect do
        CLIENT.cluster.exists_component_template(name: 'testing')
      end.to raise_error Elastic::Transport::Transport::Errors::NotFound
    end
  end
end

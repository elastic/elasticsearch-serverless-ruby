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

describe 'API:logstash' do
  let(:id) { 'logstash_test_pipeline' }
  let(:description) { 'Sample pipeline for illustration purposes' }

  it 'performs the request' do
    # PUT Pipeline
    response = CLIENT.logstash.put_pipeline(
      id: id,
      body: {
        description: description,
        last_modified: '2021-01-02T02:50:51.250Z',
        pipeline_metadata: {
          type: 'logstash_pipeline',
          version: '1'
        },
        username: 'elastic',
        pipeline: 'input {}\n filter { grok {} }\n output {}',
        pipeline_settings: {
          'pipeline.workers' => 1,
          'pipeline.batch.size' => 125,
          'pipeline.batch.delay' => 50,
          'queue.type' => 'memory',
          'queue.max_bytes' => '1gb',
          'queue.checkpoint.writes' => 1024
        }
      }
    )
    expect(response.status).to eq 201
    # GET Pipeline
    response = CLIENT.logstash.get_pipeline(id: id)
    expect(response.status).to eq 200
    expect(response[id]['description']).to eq description
    # DELETE Pipeline
    response = CLIENT.logstash.delete_pipeline(id: id)
    expect(response.status).to eq 200
  end
end

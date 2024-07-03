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

require 'elasticsearch-serverless'
require 'rspec'

RSpec.configure do |config|
  config.formatter = 'documentation'
  config.color = true
  config.tty = true
end

api_key = ENV['API_KEY']
url = ENV['ELASTICSEARCH_URL']
arguments = {
  retry_on_status: [409],
  retry_on_failure: 10,
  delay_on_retry: 60_000,
  request_timeout: 120
}
CLIENT = ElasticsearchServerless::Client.new(api_key: api_key, url: url, arguments: arguments)

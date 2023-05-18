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

require_relative './lib/elasticsearch-serverless/version.rb'

Gem::Specification.new do |s|
  s.name        = "elasticsearch-serverless"
  s.version     = ElasticsearchServerless::VERSION
  s.summary     = "Elasticsearch Serverless Client"
  s.authors     = ["Fernando Briano"]
  s.email       = "support@elastic.co"
  s.files       = Dir['lib/**/*.rb']
  s.homepage    =
    "https://rubygems.org/gems/elasticsearch-serverless"
  s.license       = "Apache-2.0"

  s.add_dependency 'elastic-transport', '~> 8'

  s.add_development_dependency 'debug', '>= 1.0.0' unless defined?(JRUBY_VERSION)
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'vcr', '~> 6'
end

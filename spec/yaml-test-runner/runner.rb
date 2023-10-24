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

require 'logger'
require 'yaml'
require_relative '../spec_helper'
require_relative './test'

PATH = File.expand_path('../../tmp', __FILE__)

LOGGER = Logger.new($stdout)
LOGGER.level = Logger::WARN unless ENV['DEBUG']

raise RuntimeError, "Couldn't find test files. Run rake spec:download_tests to download the tests in spec/tmp" unless File.directory?(PATH)

Dir.glob("#{PATH}/**/*.yml").map do |test_file|
  yaml = YAML.load_stream(File.read(test_file))

  # Create the test object:
  setup = yaml.map.with_index { |a, i| yaml.delete_at(i) if a.keys.first == 'setup' }.compact.first&.[]('setup')
  teardown = yaml.map.with_index { |a, i| yaml.delete_at(i) if a.keys.first == 'teardown' }.compact.first
  title, actions = yaml.first.first
  test = Elastic::TestRunner::Test.new(title, test_file, setup, actions, teardown)
  test.execute
rescue Psych::SyntaxError => e
  LOGGER.warn("YAML error in #{test_file}")
  LOGGER.warn e
rescue StandardError => e
  puts("🤬 ERROR: File #{test_file}")
  LOGGER.warn e
end

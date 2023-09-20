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

require 'mkmf'
require 'rspec/core/rake_task'

desc 'Open an irb session preloaded with this library'
task :console do
  sh 'irb -r rubygems -I lib -r elasticsearch-serverless.rb'
end

namespace :spec do
  desc 'Run Unit tests'
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = Dir.glob('spec/unit/*_spec.rb')
  end

  desc 'Run API tests'
  RSpec::Core::RakeTask.new(:api) do |t|
    t.pattern = Dir.glob('spec/api/**/*_spec.rb')
  end

  desc 'Run stack compatibility tests'
  RSpec::Core::RakeTask.new(:stack) do |t|
    t.pattern = Dir.glob('spec/stack_client/**/*_spec.rb')
  end

  desc 'Run all tests'
  RSpec::Core::RakeTask.new(:all) do |t|
    t.pattern = Dir.glob('spec/**/*_spec.rb')
  end
end

desc 'Run Elasticsearch in Serverless mode with Docker'
task :docker, [:version] do |_, params|
  abort 'Docker not installed' unless find_executable 'docker'
  abort 'You need to set a version, e.g. rake docker:start[7.x-SNAPSHOT]' unless params[:version]

  system("STACK_VERSION=#{params[:version]} ./.ci/run-elasticsearch.sh")
end

desc 'Bump Version'
task :bump, :version do |_, args|
  abort('[!] Required argument [version] missing') unless args[:version]

  regexp = Regexp.new(/VERSION = ("|'([0-9.]+(-SNAPSHOT)?)'|")/)
  file = './lib/elasticsearch-serverless/version.rb'
  content = File.read(file)

  if (match = content.match(regexp))
    old_version = match[2]
    content.gsub!(old_version, args[:version])
    puts "[#{old_version}] -> [#{args[:version]}] in #{file.gsub('./', '')}"
    File.open(file, 'w') { |f| f.puts content }
  else
    abort "Couldn't find the version in #{file} "
  end
rescue StandardError => e
  abort "[!!!] #{e.class} : #{e.message}"
end

desc "Server info"
task :info do
  require 'elasticsearch-serverless'
  client = ElasticsearchServerless::Client.new(url: ENV['ELASTICSEARCH_URL'], api_key: ENV['API_KEY'])
  pp client.info
end

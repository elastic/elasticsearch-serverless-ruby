require 'mkmf'
require 'rspec/core/rake_task'

desc 'Open an irb session preloaded with this library'
task :console do
  sh 'irb -r rubygems -I lib -r elasticsearch-serverless.rb'
end

desc 'Run RSpec tests'
RSpec::Core::RakeTask.new(:spec) do |t| 
  t.pattern = Dir.glob('spec/**/*_spec.rb')
end

desc 'Run Elasticsearch in Serverless mode with Docker'
task :docker, [:version] do |_, params|
  abort 'Docker not installed' unless find_executable 'docker'
  abort 'You need to set a version, e.g. rake docker:start[7.x-SNAPSHOT]' unless params[:version]

  system("STACK_VERSION=#{params[:version]} ./.ci/run-elasticsearch.sh")
end

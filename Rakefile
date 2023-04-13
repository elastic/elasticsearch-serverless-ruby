require 'rspec/core/rake_task'

desc 'Open an irb session preloaded with this library'
task :console do
  sh 'irb -r rubygems -I lib -r elasticsearch-serverless.rb'
end

desc 'Run RSpec tests'
RSpec::Core::RakeTask.new(:spec) do |t| 
  t.pattern = Dir.glob('spec/**/*_spec.rb')
end

require 'elasticsearch-serverless'
require 'rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'fixtures/cassettes'
end

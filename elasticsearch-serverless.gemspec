Gem::Specification.new do |s|
  s.name        = "elasticsearch-serverless"
  s.version     = "0.0.1"
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

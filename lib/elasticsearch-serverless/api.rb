require 'elasticsearch-serverless/api/response'
require 'elasticsearch-serverless/api/utils'

# Require everything in /api
Dir["#{File.dirname(__FILE__)}/api/*.rb"].each { |f| require f}

module ElasticsearchServerless
  module API
    include ElasticsearchServerless::API::Actions

    HTTP_GET          = 'GET'.freeze
    HTTP_HEAD         = 'HEAD'.freeze
    HTTP_POST         = 'POST'.freeze
    HTTP_PUT          = 'PUT'.freeze
    HTTP_DELETE       = 'DELETE'.freeze
  end
end

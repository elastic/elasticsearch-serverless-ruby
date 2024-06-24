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
#
# Auto generated from commit f284cc16f4d4b4289bc679aa1529bb504190fe80
# @see https://github.com/elastic/elasticsearch-specification
#
module ElasticsearchServerless
  module API
    module Indices
      module Actions
        # Converts an index alias to a data stream.
        # You must have a matching index template that is data stream enabled.
        # The alias must meet the following criteria:
        # The alias must have a write index;
        # All indices for the alias must have a +@timestamp+ field mapping of a +date+ or +date_nanos+ field type;
        # The alias must not have any filters;
        # The alias must not use custom routing.
        # If successful, the request removes the alias and creates a data stream with the same name.
        # The indices for the alias become hidden backing indices for the stream.
        # The write index for the alias becomes the write index for the stream.
        #
        # @option arguments [String] :name Name of the index alias to convert to a data stream. (*Required*)
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams.html
        #
        def migrate_to_data_stream(arguments = {})
          raise ArgumentError, "Required argument 'name' missing" unless arguments[:name]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _name = arguments.delete(:name)

          method = ElasticsearchServerless::API::HTTP_POST
          path   = "_data_stream/_migrate/#{Utils.listify(_name)}"
          params = {}

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end

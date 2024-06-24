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
    module MachineLearning
      module Actions
        # Deletes a trained model alias.
        # This API deletes an existing model alias that refers to a trained model. If
        # the model alias is missing or refers to a model other than the one identified
        # by the +model_id+, this API returns an error.
        #
        # @option arguments [String] :model_alias The model alias to delete. (*Required*)
        # @option arguments [String] :model_id The trained model ID to which the model alias refers. (*Required*)
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/delete-trained-models-aliases.html
        #
        def delete_trained_model_alias(arguments = {})
          raise ArgumentError, "Required argument 'model_id' missing" unless arguments[:model_id]
          raise ArgumentError, "Required argument 'model_alias' missing" unless arguments[:model_alias]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _model_alias = arguments.delete(:model_alias)

          _model_id = arguments.delete(:model_id)

          method = ElasticsearchServerless::API::HTTP_DELETE
          path   = "_ml/trained_models/#{Utils.listify(_model_id)}/model_aliases/#{Utils.listify(_model_alias)}"
          params = {}

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end

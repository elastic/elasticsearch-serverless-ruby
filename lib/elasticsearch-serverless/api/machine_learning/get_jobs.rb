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
        # Retrieves configuration information for anomaly detection jobs.
        #
        # @option arguments [String, Array] :job_id Identifier for the anomaly detection job. It can be a job identifier, a group name, or a wildcard expression. If you do not specify one of these options, the API returns information for all anomaly detection jobs.
        # @option arguments [Boolean] :allow_no_match Specifies what to do when the request:  1. Contains wildcard expressions and there are no jobs that match. 2. Contains the _all string or no identifiers and there are no matches. 3. Contains wildcard expressions and there are only partial matches.  The default value is +true+, which returns an empty +jobs+ array when there are no matches and the subset of results when there are partial matches. If this parameter is +false+, the request returns a +404+ status code when there are no matches or only partial matches. Server default: true.
        # @option arguments [Boolean] :exclude_generated Indicates if certain fields should be removed from the configuration on retrieval. This allows the configuration to be in an acceptable format to be retrieved and then added to another cluster.
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-get-job.html
        #
        def get_jobs(arguments = {})
          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _job_id = arguments.delete(:job_id)

          method = ElasticsearchServerless::API::HTTP_GET
          path   = if _job_id
                     "_ml/anomaly_detectors/#{Utils.listify(_job_id)}"
                   else
                     "_ml/anomaly_detectors"
                   end
          params = Utils.process_params(arguments)

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end

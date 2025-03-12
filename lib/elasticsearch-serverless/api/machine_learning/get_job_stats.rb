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
        # Get anomaly detection jobs usage info.
        #
        # @option arguments [String] :job_id Identifier for the anomaly detection job. It can be a job identifier, a
        #  group name, a comma-separated list of jobs, or a wildcard expression. If
        #  you do not specify one of these options, the API returns information for
        #  all anomaly detection jobs.
        # @option arguments [Boolean] :allow_no_match Specifies what to do when the request:
        #  - Contains wildcard expressions and there are no jobs that match.
        #  - Contains the _all string or no identifiers and there are no matches.
        #  - Contains wildcard expressions and there are only partial matches.
        #  If +true+, the API returns an empty +jobs+ array when
        #  there are no matches and the subset of results when there are partial
        #  matches. If +false+, the API returns a +404+ status
        #  code when there are no matches or only partial matches. Server default: true.
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-ml-get-job-stats
        #
        def get_job_stats(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || 'ml.get_job_stats' }

          defined_params = [:job_id].each_with_object({}) do |variable, set_variables|
            set_variables[variable] = arguments[variable] if arguments.key?(variable)
          end
          request_opts[:defined_params] = defined_params unless defined_params.empty?

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _job_id = arguments.delete(:job_id)

          method = ElasticsearchServerless::API::HTTP_GET
          path   = if _job_id
                     "_ml/anomaly_detectors/#{Utils.listify(_job_id)}/_stats"
                   else
                     '_ml/anomaly_detectors/_stats'
                   end
          params = Utils.process_params(arguments)

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end

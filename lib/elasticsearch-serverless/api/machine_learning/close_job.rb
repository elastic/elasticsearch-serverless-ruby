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
        # Closes one or more anomaly detection jobs. A job can be opened and closed multiple times throughout its lifecycle.
        #
        # @option arguments [String] :job_id Identifier for the anomaly detection job. It can be a job identifier, a group name, or a wildcard expression. You can close multiple anomaly detection jobs in a single API request by using a group name, a comma-separated list of jobs, or a wildcard expression. You can close all jobs by using +_all+ or by specifying +*+ as the job identifier. (*Required*)
        # @option arguments [Boolean] :allow_no_match Specifies what to do when the request: contains wildcard expressions and there are no jobs that match; contains the  +_all+ string or no identifiers and there are no matches; or contains wildcard expressions and there are only partial matches. By default, it returns an empty jobs array when there are no matches and the subset of results when there are partial matches. If +false+, the request returns a 404 status code when there are no matches or only partial matches. Server default: true.
        # @option arguments [Boolean] :force Use to close a failed job, or to forcefully close a job which has not responded to its initial close request; the request returns without performing the associated actions such as flushing buffers and persisting the model snapshots. If you want the job to be in a consistent state after the close job API returns, do not set to +true+. This parameter should be used only in situations where the job has already failed or where you are not interested in results the job might have recently produced or might produce in the future.
        # @option arguments [Time] :timeout Controls the time to wait until a job has closed. Server default: 30m.
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body request body
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-close-job.html
        #
        def close_job(arguments = {})
          raise ArgumentError, "Required argument 'job_id' missing" unless arguments[:job_id]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          _job_id = arguments.delete(:job_id)

          method = ElasticsearchServerless::API::HTTP_POST
          path   = "_ml/anomaly_detectors/#{Utils.listify(_job_id)}/_close"
          params = Utils.process_params(arguments)

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end

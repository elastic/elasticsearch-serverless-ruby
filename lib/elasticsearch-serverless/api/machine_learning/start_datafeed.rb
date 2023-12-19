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
        # Starts one or more datafeeds.
        #
        # @option arguments [String] :datafeed_id A numerical character string that uniquely identifies the datafeed. This identifier can contain lowercase alphanumeric characters (a-z and 0-9), hyphens, and underscores. It must start and end with alphanumeric characters. (*Required*)
        # @option arguments [String, Time] :end The time that the datafeed should end, which can be specified by using one of the following formats:  * ISO 8601 format with milliseconds, for example +2017-01-22T06:00:00.000Z+ * ISO 8601 format without milliseconds, for example +2017-01-22T06:00:00+00:00+ * Milliseconds since the epoch, for example +1485061200000+  Date-time arguments using either of the ISO 8601 formats must have a time zone designator, where +Z+ is accepted as an abbreviation for UTC time. When a URL is expected (for example, in browsers), the +++ used in time zone designators must be encoded as +%2B+. The end time value is exclusive. If you do not specify an end time, the datafeed runs continuously.
        # @option arguments [String, Time] :start The time that the datafeed should begin, which can be specified by using the same formats as the +end+ parameter. This value is inclusive. If you do not specify a start time and the datafeed is associated with a new anomaly detection job, the analysis starts from the earliest time for which data is available. If you restart a stopped datafeed and specify a start value that is earlier than the timestamp of the latest processed record, the datafeed continues from 1 millisecond after the timestamp of the latest processed record.
        # @option arguments [Time] :timeout Specifies the amount of time to wait until a datafeed starts. Server default: 20s.
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body request body
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-start-datafeed.html
        #
        def start_datafeed(arguments = {})
          raise ArgumentError, "Required argument 'datafeed_id' missing" unless arguments[:datafeed_id]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          _datafeed_id = arguments.delete(:datafeed_id)

          method = ElasticsearchServerless::API::HTTP_POST
          path   = "_ml/datafeeds/#{Utils.listify(_datafeed_id)}/_start"
          params = Utils.process_params(arguments)

          ElasticsearchServerless::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end

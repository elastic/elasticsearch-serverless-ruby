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
    module Actions
      # Creates a new document in the index.
      #
      # Returns a 409 response when a document with a same ID already exists in the index.
      #
      # @option arguments [String] :id Unique identifier for the document. (*Required*)
      # @option arguments [String] :index Name of the data stream or index to target. If the target doesn’t exist and matches the name or wildcard (+*+) pattern of an index template with a +data_stream+ definition, this request creates the data stream. If the target doesn’t exist and doesn’t match a data stream template, this request creates the index. (*Required*)
      # @option arguments [String] :pipeline ID of the pipeline to use to preprocess incoming documents. If the index has a default ingest pipeline specified, then setting the value to +_none+ disables the default ingest pipeline for this request. If a final pipeline is configured it will always run, regardless of the value of this parameter.
      # @option arguments [String] :refresh If +true+, Elasticsearch refreshes the affected shards to make this operation visible to search, if +wait_for+ then wait for a refresh to make this operation visible to search, if +false+ do nothing with refreshes. Valid values: +true+, +false+, +wait_for+. Server default: false.
      # @option arguments [String] :routing Custom value used to route operations to a specific shard.
      # @option arguments [Time] :timeout Period the request waits for the following operations: automatic index creation, dynamic mapping updates, waiting for active shards. Server default: 1m.
      # @option arguments [Integer] :version Explicit version number for concurrency control. The specified version must match the current version of the document for the request to succeed.
      # @option arguments [String] :version_type Specific version type: +external+, +external_gte+.
      # @option arguments [Integer, String] :wait_for_active_shards The number of shard copies that must be active before proceeding with the operation. Set to +all+ or any positive integer up to the total number of shards in the index (+number_of_replicas+1+). Server default: 1.
      # @option arguments [Hash] :headers Custom HTTP headers
      # @option arguments [Hash] :body document
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-index_.html
      #
      def create(arguments = {})
        if arguments[:id]
          index arguments.update op_type: 'create'
        else
          index arguments
        end
      end
    end
  end
end

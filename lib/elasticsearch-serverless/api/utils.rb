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

require 'json'
require 'erb'

module ElasticsearchServerless
  module API
    module Utils

      def self.process_params(arguments)
        arguments = Hash[arguments] unless arguments.is_a?(Hash)
        Hash[arguments.map { |k, v| v.is_a?(Array) ? [k, __listify(v, { escape: false })] : [k, v] }] # Listify Arrays
      end

      # Convert an array of payloads into Elasticsearch `header\ndata` format
      #
      # Supports various different formats of the payload: Array of Strings, Header/Data pairs,
      # or the conveniency "combined" format where data is passed along with the header
      # in a single item.
      #
      #     Elasticsearch::API::Utils.__bulkify [
      #       { :index =>  { :_index => 'myindexA', :_type => 'mytype', :_id => '1', :data => { :title => 'Test' } } },
      #       { :update => { :_index => 'myindexB', :_type => 'mytype', :_id => '2', :data => { :doc => { :title => 'Update' } } } }
      #     ]
      #
      #     # => {"index":{"_index":"myindexA","_type":"mytype","_id":"1"}}
      #     # => {"title":"Test"}
      #     # => {"update":{"_index":"myindexB","_type":"mytype","_id":"2"}}
      #     # => {"doc":{"title":"Update"}}
      #
      def self.bulkify(payload)
        operations = %w[index create delete update]

        case
        # Hashes with `:data`
        when payload.any? { |d| d.is_a?(Hash) && d.values.first.is_a?(Hash) && operations.include?(d.keys.first.to_s) && (d.values.first[:data] || d.values.first['data']) }
          payload = payload.
                      inject([]) do |sum, item|
            operation, meta = item.to_a.first
            meta            = meta.clone
            data            = meta.delete(:data) || meta.delete('data')

            sum << { operation => meta }
            sum << data if data
            sum
          end.map { |item| JSON.dump(item) }
          payload << '' unless payload.empty?
        # Array of strings
        when payload.all? { |d| d.is_a? String }
          payload << ''
        # Header/Data pairs
        else
          payload = payload.map { |item| JSON.dump(item) }
          payload << ''
        end

        payload = payload.join("\n")
      end

      # Create a "list" of values from arguments, ignoring nil values and encoding special characters.
      #
      # @example Create a list from array
      #     __listify(['A','B']) # => 'A,B'
      #
      # @example Create a list from arguments
      #     __listify('A','B') # => 'A,B'
      #
      # @example Escape values
      #     __listify('foo','bar^bam') # => 'foo,bar%5Ebam'
      #
      # @example Do not escape the values
      #     __listify('foo','bar^bam', escape: false) # => 'foo,bar^bam'
      #
      # @api private
      def self.listify(*list)
        options = list.last.is_a?(Hash) ? list.pop : {}

        escape = options[:escape]
        Array(list).
          flat_map { |e| e.respond_to?(:split) ? e.split(',') : e }.
          flatten.
          compact.
          map { |e| escape == false ? e : escape(e) }.
          join(',')
      end

      # URL-escape a string
      #
      # @example
      #     __escape('foo/bar') # => 'foo%2Fbar'
      #     __escape('bar^bam') # => 'bar%5Ebam'
      #
      # @api private
      def self.escape(string)
        return string if string == '*'
        ERB::Util.url_encode(string.to_s)
      end

    end
  end
end

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

module Elastic
  module TestRunner
    module CodeRunner
      COMPARATORS = {
        'lt' => '<',
        'lte' => '<=',
        'gt' => '>',
        'gte' => '>='
      }.freeze
      # The main functionality in the test runner, run actions with the client from YAML `do`
      # specifications.
      #
      def do_action(action)
        action = action.first if action.is_a?(Array)
        if action.is_a?(String)
          method, params = action, {}
        else
          method, params = action.first
        end

        client = CLIENT

        # Get the namespace client if the method is namespaced
        if method.include?('.')
          arrayed_method = method.split('.')
          client = CLIENT.send(arrayed_method.first)
          method = arrayed_method.last
        end

        @response = client.send(
          method.to_sym,
          process_params(params)
        )
        LOGGER.debug("\n#{@response}\n")
      rescue Elastic::Transport::Transport::Error => e
        print_error(e)
        raise e
      rescue StandardError => e
        print_error(e)
        raise e
      end

      # Code for matching expectations and response
      #
      def do_match(action)
        k, v = action['match'].first

        if v.is_a?(String) && v.include?('$')
          v = instance_variable_get(v.gsub('$', '@'))
        end

        result = search_in_response(k)

        if !result.nil? && (
             result == v || (result.respond_to?(:include?) && result.include?(v))
           )
          print_success
        else
          print_failure(action, @response)
          # TODO replace with custom exception so we don't print it out again in caller code
          raise StandardError.new("Failure: #{action}, #{@response}")
        end
      end

      def do_length(action)
        k, v = action['length'].first

        result = search_in_response(k).count
        if result && result == v
          print_success
        else
          # TODO: Extract this
          print_failure(action, @response)
        end
      end

      #
      # action - { 'is_true' => field } or { 'is_true' => '' }
      #
      def is_true(action)
        if @response == true || !@response[action['is_true']].nil?
          print_success
        else
          print_failure(action, @response)
        end
      end

      def is_false(action)
        if @response == false
          print_success
        else
          print_failure(action, @response)
        end
      end

      #
      # Used for comparing gte (greater or equal than), gt (greater than), lte (less or equal than)
      # and lt (less than)
      # action - { 'gte' => { 'key' => value } }
      #
      def compare(action)
        operator, value = action.first

        result = search_in_response(value.keys.first)
        if result && result.send(COMPARATORS[operator], value[value.keys.first])
          print_success
        else
          print_failure(action, @response)
        end
      end

      # When the yaml test has a set instruction, set an instance variable with that value coming
      # from the response.
      def set_variable(action)
        k, v = action['set'].first
        instance_variable_set("@#{v}", search_in_response(k))
      end

      private

      # Given a key coming from a test definition, search the response body for a matching value.
      #
      def search_in_response(keys)
        if (match = /\$([a-z]+)/.match(keys))
          return @response.send(match[1])
        end

        if keys.include?('.')
          key = split_and_parse_key(keys)
          return find_value_in_document(key, @response.body)
        end

        @response[keys]
      end

      # Symbolizes keys and replaces parameters defined as dynamic in the yaml spec (e.g. $body)
      # with the corresponding variable set in set_variable
      #
      def process_params(params)
        params = params.transform_keys(&:to_sym)
        params.map do |key, param|
          params[key] = process_params(param) if param.is_a?(Hash)
          set_param_variable(params, key, param)
          param.map { |param| set_param_variable(params, key, param) } if param.is_a?(Array)
        end
        params
      end

      def set_param_variable(params, key, param)
        if param.is_a?(String) && param.include?('$')
          params[key] = instance_variable_get(param.gsub('$', '@'))
        end
      end
      # Given a list of keys, find the value in a recursively nested document.
      #
      # @param [ Array<String> ] chain The list of nested document keys.
      # @param [ Hash ] document The document to find the value in.
      #
      # @return [ Object ] The value at the nested key.
      #
      def find_value_in_document(chain, document)
        return document[chain] unless chain.is_a?(Array)
        return document[chain[0]] unless chain.size > 1

        # a number can be a string key in a Hash or indicate an element in a list
        if document.is_a?(Hash)
          find_value_in_document(chain[1..-1], document[chain[0].to_s]) if document[chain[0].to_s]
        elsif document[chain[0]]
          find_value_in_document(chain[1..-1], document[chain[0]]) if document[chain[0]]
        end
      end

      # Given a string representing a nested document key using dot notation,
      #   split it, keeping escaped dots as part of a key name and replacing
      #   numerics with a Ruby Integer.
      #
      # For example:
      #   "joe.metadata.2.key2" => ['joe', 'metadata', 2, 'key2']
      #   "jobs.0.node.attributes.ml\\.enabled" => ["jobs", 0, "node", "attributes", "ml\\.enabled"]
      #
      # @param [ String ] chain The list of nested document keys.
      # @param [ Hash ] document The document to find the value in.
      #
      # @return [ Array<Object> ] A list of the nested keys.
      #
      def split_and_parse_key(key)
        key.split(/(?<!\\)\./).reject(&:empty?).map do |key_part|
          case key_part
          when /^\.\$/ # For keys in the form of .$key
            key_part.gsub(/^\./, '')
          when /\A[-+]?[0-9]+\z/
            key_part.to_i
          else
            key_part.gsub('\\', '')
          end
        end.reject { |k| k == '$body' }
      end
    end
  end
end

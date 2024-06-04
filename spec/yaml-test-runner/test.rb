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

require_relative 'printer'
require_relative 'code_runner'

module Elastic
  module TestRunner
    class Test
      include Elastic::TestRunner::Printer
      include Elastic::TestRunner::CodeRunner

      def initialize(title, file, setup, actions, teardown)
        @title = title
        @file = test_filename(file)
        @setup = setup
        @actions = actions
        @teardown = teardown
      end

      def execute
        begin
          run_setup
          run_actions
        ensure
          run_teardown
        end
      end

      def run_actions
        return unless @actions

        @actions.map { |action| run_action(action) }
      end

      def run_action(action)
        definition = action.keys.first

        case definition
        when 'do'
          do_action(action['do'])
        when 'set'
          set_variable(action)
        when 'match'
          do_match(action)
        when 'length'
          do_length(action)
        when 'is_true'
          is_true(action)
        when 'is_false'
          is_false(action)
        when 'gt', 'gte', 'lt', 'lte'
          compare(action)
        end
      end

      def run_setup
        return unless @setup

        @setup.map do |step|
          do_action(step['do']) if step['do']
        end
      end

      def run_teardown
        return unless @teardown

        @teardown['teardown'].map { |step| do_action(step['do']) }
      end

      def count
        @actions.length
      end
    end
  end
end

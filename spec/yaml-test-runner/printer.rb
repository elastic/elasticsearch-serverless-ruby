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
require_relative 'errors'

module Elastic
  module TestRunner
    module Printer
      def print_success
        response = if [true, false].include? @response
                     @response
                   else
                     @response.status
                   end
        puts "🟢 #{@file} #{@title} passed. Response: #{response}"
      end

      def print_failure(action, response)
        puts "🔴 #{@file} #{@title} failed"
        puts "Expected result: #{action}" # TODO: Show match/length differently
        if response.is_a?(ElasticsearchServerless::API::Response)
          puts 'Response:'
          pp response.body
        else
          pp response
        end
        raise Elastic::TestRunner::TestFailure
      end

      def print_match_failure(action, response)
        keys = action['match'].keys.first
        value = action['match'].values.first
        message = <<~MSG
                  🔴 #{@file} #{@title} failed
                  Expected: { #{keys}: #{value} }
                  Actual  : { #{keys}: #{search_in_response(action['match'].keys.first)} }
                MSG
        LOGGER.debug @response
        raise Elastic::TestRunner::TestFailure.new(message)
      end

      def print_error(e)
        puts "❌ ERROR: #{@file} #{@title} failed\n"
        LOGGER.error e.display
        backtrace = e.backtrace.join("\n")
        LOGGER.error "#{backtrace}\n"
        raise e
      end

      def test_filename(file)
        name = file.split('/')
        "#{name[-2]}/#{name[-1]}"
      end
    end
  end
end

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
    module Printer
      def print_success
        puts "✅ #{@file} #{@title} passed. Response: #{@response.status}"
      end

      def print_failure(action, response_value)
        puts "❌ #{@file} #{@title} failed"
        puts "Expected result: #{action['match']}"
        puts "Result in response: #{response_value}"
        LOGGER.debug "\n#{@respons}\n"
      end

      def print_error(e)
        puts "🤬 ERROR: #{@file} #{@title} failed\n"
        LOGGER.error e.display
        LOGGER.error "#{e.backtrace}\n"
        raise e
      end

      def test_filename(file)
        name = file.split('/')
        "#{name[-2]}/#{name[-1]}"
      end
    end
  end
end

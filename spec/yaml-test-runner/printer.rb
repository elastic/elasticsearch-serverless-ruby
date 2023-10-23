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

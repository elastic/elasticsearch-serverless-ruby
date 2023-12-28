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

require 'erb'

# TODO: migrate this to the code generator
path = File.expand_path("#{__dir__}/../lib/elasticsearch-serverless/api/**/*.rb")
api_info = []

Dir.glob(path) do |file|
  next if file.match?('api/response.rb') || file.match?('api/utils.rb')

  content = File.read(file)
  api = file.gsub(/[a-zA-Z\/\-]+\/lib\/elasticsearch-serverless\/api\//, '')
          .gsub('.rb', '')
          .gsub('/', '.')
  url = content.match(/@see https?:\/\/www.elastic.co\/.+/)[0]
          .gsub('@see ', '')
  description = content
                  .match(/module Actions\n\s+#.+\n/)[0]
                  .gsub(/module Actions\n\s+#\s/,'')
  api_info << {api: api, description: description, url: url}
end

template_content = <<-EOF
# Available APIs

These are the available APIs in the Elasticsearch Serverless Ruby client.

<%- api_info.each do |endpoint| %>
* `<%= endpoint[:api] %>` - <%= endpoint[:description] %> <%= endpoint[:url] -%>
<%- end -%>
EOF
template = ERB.new(template_content, trim_mode: '-')

# Write content to docs/apis.md
File.write(File.expand_path("#{__dir__}/../docs/apis.md"), template.result(binding))


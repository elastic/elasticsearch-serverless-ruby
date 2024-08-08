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
      # Search a vector tile.
      # Searches a vector tile for geospatial values.
      #
      # @option arguments [String, Array] :index Comma-separated list of data streams, indices, or aliases to search (*Required*)
      # @option arguments [String] :field Field containing geospatial data to return (*Required*)
      # @option arguments [Integer] :zoom Zoom level for the vector tile to search (*Required*)
      # @option arguments [Integer] :x X coordinate for the vector tile to search (*Required*)
      # @option arguments [Integer] :y Y coordinate for the vector tile to search (*Required*)
      # @option arguments [Boolean] :exact_bounds If false, the meta layer’s feature is the bounding box of the tile.
      #  If true, the meta layer’s feature is a bounding box resulting from a
      #  geo_bounds aggregation. The aggregation runs on <field> values that intersect
      #  the <zoom>/<x>/<y> tile with wrap_longitude set to false. The resulting
      #  bounding box may be larger than the vector tile.
      # @option arguments [Integer] :extent Size, in pixels, of a side of the tile. Vector tiles are square with equal sides. Server default: 4096.
      # @option arguments [String] :grid_agg Aggregation used to create a grid for +field+.
      # @option arguments [Integer] :grid_precision Additional zoom levels available through the aggs layer. For example, if <zoom> is 7
      #  and grid_precision is 8, you can zoom in up to level 15. Accepts 0-8. If 0, results
      #  don’t include the aggs layer. Server default: 8.
      # @option arguments [String] :grid_type Determines the geometry type for features in the aggs layer. In the aggs layer,
      #  each feature represents a geotile_grid cell. If 'grid' each feature is a Polygon
      #  of the cells bounding box. If 'point' each feature is a Point that is the centroid
      #  of the cell. Server default: grid.
      # @option arguments [Integer] :size Maximum number of features to return in the hits layer. Accepts 0-10000.
      #  If 0, results don’t include the hits layer. Server default: 10000.
      # @option arguments [Boolean] :with_labels If +true+, the hits and aggs layers will contain additional point features representing
      #  suggested label positions for the original features.
      # @option arguments [Hash] :headers Custom HTTP headers
      # @option arguments [Hash] :body request body
      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/search-vector-tile-api.html
      #
      def search_mvt(arguments = {})
        request_opts = { endpoint: arguments[:endpoint] || "search_mvt" }

        defined_params = [:index, :field, :zoom, :x, :y].inject({}) do |set_variables, variable|
          set_variables[variable] = arguments[variable] if arguments.key?(variable)
          set_variables
        end
        request_opts[:defined_params] = defined_params unless defined_params.empty?

        raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]
        raise ArgumentError, "Required argument 'field' missing" unless arguments[:field]
        raise ArgumentError, "Required argument 'zoom' missing" unless arguments[:zoom]
        raise ArgumentError, "Required argument 'x' missing" unless arguments[:x]
        raise ArgumentError, "Required argument 'y' missing" unless arguments[:y]

        arguments = arguments.clone
        headers = arguments.delete(:headers) || {}

        body = arguments.delete(:body)

        _index = arguments.delete(:index)

        _field = arguments.delete(:field)

        _zoom = arguments.delete(:zoom)

        _x = arguments.delete(:x)

        _y = arguments.delete(:y)

        method = ElasticsearchServerless::API::HTTP_POST
        path   = "#{Utils.listify(_index)}/_mvt/#{Utils.listify(_field)}/#{Utils.listify(_zoom)}/#{Utils.listify(_x)}/#{Utils.listify(_y)}"
        params = Utils.process_params(arguments)

        ElasticsearchServerless::API::Response.new(
          perform_request(method, path, params, body, headers, request_opts)
        )
      end
    end
  end
end

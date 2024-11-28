# Changelog

## 0.6.0

### Changes in APIs:

- Updated source code documentation, updated [rubydocs](https://rubydoc.info/gems/elasticsearch-serverless).
- `async_search.status` - Adds `keep_alive` Time parameter. Specifies how long the async search needs to be available. Ongoing async searches and any saved search results are deleted after this period. Server default: 5d.
- `async_search.submit` - Removes `min_compatible_shared_node` and `scroll` parameters.
- `cat.aliases`, `cat.count`, `cat.help`, `cat.indices`, `cat.ml_data_frame_analytics`, `cat.ml_datafeeds`, `cat.ml_jobs`, `cat.ml_trained_models`, `cat.transforms`, `indices.exists_alias`, `indices.get_alias` - Removes `local` parameter (not applicable).
- Inference APIs promoted from Experimental to stable: `inference.delete`, `inference.get`, `inference.inference`, `inference.put`.
- `open_point_in_time` adds `allow_partial_search_results` boolean parameter. If `false`, creating a point in time request when a shard is missing or unavailable will throw an exception. If `true`, the point in time will contain all the shards that are available at the time of the request.
- `search` - Removes `min_compatible_shard_node` parameter (not applicable).

## 0.5.0

### Client

- Removed Ruby 3.0 from testing matrix, it's been end of life for over 6 months.

### Changes in APIs:

The following APIs have been removed as they're not available on Serverless:
* `enrich.stats`
* `indices.delete_data_lifecycle`

Changes in `scroll` APIs, the parameter `scroll_id` has been removed as it's been deprecated, it should be sent via the body:
* `clear_scroll`
* `scroll`

Update `indices.put_data_lifecycle` - body (lifecycle) is a required argument.

Added the following APIs:
* `machine_learning.infer_trained_model`
* `query_rules.test`
* `security.delete_role.rb`
* `security.get_builtin_privileges.rb`
* `security.get_role.rb`
* `security.put_role.rb`
* `tasks.get`

## 0.4.0

### Changes in APIs:

The following APIs have been removed as they are not supported at the moment:
* `esql.query`
* `indices.data_streams_stats`

Updates APIs:
* `indices.get_data_stream` - `verbose` Boolean parameter added: Whether the maximum timestamp for each data stream should be calculated and returned.
* `indices.resolve_index` adds two parameters:
** `ignore_unavailable` [Boolean] If `false`, the request returns an error if it targets a missing or closed index.
** `allow_no_indices` [Boolean] If `false`, the request returns an error if any wildcard expression, index alias, or `_all` value targets only missing or closed indices.
* `open_point_in_time` - `body` Hash parameter added.
* `update_by_query` - `q` String parameter added: Query in the Lucene query string syntax.

The following **timeout parameters** were added in several indices APIs:
* `timeout`:  Period to wait for a response. If no response is received before the timeout expires, the request fails and returns an error. Server default: 30s.
* `master_timeout`: Period to wait for a connection to the master node. If no response is received before the timeout expires, the request fails and returns an error. Server default: 30s.

Added in the following APIs:
* `indices.create_data_stream` - timeout, master_timeout
* `indices.delete_data_stream` - master_timeout
* `indices.get_data_lifecycle` - master_timeout
* `indices.get_data_stream` - master_timeout
* `indices.migrate_to_data_stream` - timeout, master_timeout

## 0.3.0

### Client

* Updates elastic-transport version dependency to `~> 8.3`.
* Adds native support for OpenTelemetry. See [Using OpenTelemetry](https://www.elastic.co/guide/en/elasticsearch/client/ruby-api/current/opentelemetry.html).

### Changes in APIs:

* Adds connector APIs: `check_in`, `delete`, `get`, `list`, `post`, `put`, `sync_job_cancel`, `sync_job_delete`, `sync_job_get`, `sync_job_list`, `sync_job_post`, `update_active_filtering`, `update_api_key_id`, `update_configuration`, `update_error`, `update_filtering`, `update_filtering_validation`, `update_index_name`, `update_name`, `update_native`, `update_pipeline`, `update_scheduling`, `update_service_type`, `update_status`.
* Updates termvectors APIs, adds deprecation notice for `termvector`, please use the plural version `termvectors` instead.
* Updates source code documentation for all APIs.  Check [rubydoc](https://rubydoc.info/gems/elasticsearch-serverless/) for the API reference, or run `yardoc` in the root of the project if you've checked out the code. The API reference documentation will be generated in the `doc` folder.

## 0.2.0

### Client

* Extracts YAML test runner into [es-test-runner](https://github.com/elastic/es-test-runner-ruby).
* Adds timeout/retry related arguments to client instantiation in `arguments` Hash:
** `request_timeout` [Integer] the request timeout to be passed to transport options in seconds.
** `retry_on_failure` [Boolean, Number] Retry X times when request fails before raising and exception (false by default)
** `retry_on_status` [Array<Number>] Retry when specific status codes are returned
** `delay_on_retry` [Number] Delay in milliseconds between each retry (0 by default)

### Changes in APIs:

* Adds inference APIs: `inference.delete`, `inference.get`, `inference.inference`, `inference.put`.
* Adds `machine_learning.update_trained_model_deployment` API.
* Reorganizes Query rulesets and rules APIs. All query rules APIs are now under `query_rules` namespace:
** `query_rules.delete_rule`
** `query_rules.delete_ruleset`
** `query_rules.get_rule`
** `query_rules.get_ruleset`
** `query_rules.list_rulesets`
** `query_rules.put_rule`
** `query_rules.put_ruleset`
* Source code documentation updated for better YARD formatting. Check [rubydoc](https://rubydoc.info/gems/elasticsearch-serverless/) for the API reference, or run `yardoc` in the root of the project if you've checked out the code. The API reference documentation will be generated in the `doc` folder.
* `create` -  Adds [Integer, String] parameter `:wait_for_active_shards`: The number of shard copies that must be active before proceeding with the operation. Set to +all+ or any positive integer up to the total number of shards in the index (+number_of_replicas+1+). Server default: 1.
* `field_caps` - Adds boolean parameter `:include_empty_fields`: If false, empty fields are not included in the response. Server default: true.
* `get`, `mget`, `search` - Add boolean parameter `:force_synthetic_source`: Should this request force synthetic _source? Use this to test if the mapping supports synthetic _source and to get a sense of the worst case performance. Fetches with this enabled will be slower the enabling synthetic source natively in the index.
* `ml.get_trained_models` - Adds [String, Array] parameter `:model_id`: The unique identifier of the trained model or a model alias.  You can get information for multiple trained models in a single API request by using a comma-separated list of model IDs or a wildcard expression.
* `ml.put_calendar_job` Adds [String, Array] parameter `:job_id`: An identifier for the anomaly detection jobs. It can be a job identifier, a group name, or a comma-separated list of jobs or groups. (*Required*)
* `ml.put_trained_model` - Adds boolean parameter `:wait_for_completion`: Whether to wait for all child operations (e.g. model download) to complete.
* `search_application.search` - Adds boolean parameter `:typed_keys`: Determines whether aggregation names are prefixed by their respective types in the response.
* `security.get_api_key` - Adds boolean parameter `:active_only` A boolean flag that can be used to query API keys that are currently active. An API key is considered active if it is neither invalidated, nor expired at query time. You can specify this together with other parameters such as `owner` or `name`. If `active_only` is false, the response will include both active and inactive (expired or invalidated) keys. Adds boolean parameter `:with_profile_uid`: Determines whether to also retrieve the profile uid, for the API key owner principal, if it exists.
* `security.query_api_keys` - Adds boolean parameter `:with_profile_uid`: Determines whether to also retrieve the profile uid, for the API key owner principal, if it exists. Adds boolean parameter `:typed_keys`: Determines whether aggregation names are prefixed by their respective types in the response.

## 0.1.0

- Added ES|QL `query` API. See [documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/esql-rest.html).
* `indices.put_index_template` has two parameters added:
  * `master_timeout` Period to wait for a connection to the master node. If no response is received before the timeout expires, the request fails and returns an error. Server default: 30s.
  * `cause` User defined reason for creating/updating the index template

## 0.1.0.20231031.pre

- A lot of Serverless APIs were added to the client. 200 Serverless endpoints are supported and tested via the client starting in this version. See [APIs](https://github.com/elastic/elasticsearch-serverless-ruby/blob/main/docs/apis.md) for the full list of available endpoints, a brief description and the link to the official docs on each API.
- New namespace `machine_learning` added, can be used with alias `ml`. E.g.:
```ruby
client.ml.get_jobs
client.machine_learning.get_jobs
```

## 0.0.9.20231031.pre

### Client

- General updates in documentation.
- API integration tests were migrated to run with the clients common YAML test suite.
- Refactored the client version into API_VERSION and CLIENT_VERSION for better API versioning in the future.

### API updates

See [APIs](https://github.com/elastic/elasticsearch-serverless-ruby/blob/main/docs/apis.md) for the full list of available endpoints.

New APIs in this release:

* `cat.ml_data_frame_analytics`
* `cat.ml_datafeeds`
* `cat.ml_jobs`
* `cat.ml_trained_models`
* `indices.add_block`
* `indices.create_data_stream`
* `indices.data_streams_stats`
* `indices.delete_data_stream`
* `indices.delete_index_template`
* `indices.get_data_stream`
* `indices.put_index_template`
* `query_ruleset.delete`
* `query_ruleset.get`
* `query_ruleset.list`
* `query_ruleset.put`
* `search_application.delete_behavioral_analytics`
* `search_application.get_behavioral_analytics`
* `search_application.put_behavioral_analytics`
* `search_mvt`
* `security.has_privileges`

## 0.0.8.20231030.pre

First public release of the Elasticsearch Serverless Ruby Client.

### Client

Updated: Accept only valid parameters when instantiating a new client. Supported parameters for now are:
`:adapter, :log, :logger, :serializer_class, :trace, :tracer, :headers`.

These can be passed in to the client on instantiation and will be passed to [elastic-transport](https://github.com/elastic/elastic-transport-ruby):

```ruby
client = ElasticsearchServerless::Client.new(
  api_key: 'API_KEY',
  url: 'URL',
  arguments: {
    adapter: :net_http_persistent,
    log: true,
    logger: MyLogger.new
  }
)
```

### API updates

See [APIs](https://github.com/elastic/elasticsearch-serverless-ruby/blob/main/docs/apis.md) for the full list of available endpoints.

New APIs in this release:

- `logstash.delete_pipeline`
- `logstash.get_pipeline`
- `logstash.put_pipeline`
- `indices.refresh`
- `explain`
- `reindex`
- `delete_script`
- `get_script`
- `put_script`
- `scripts_painless_execute`
- `sql.clear_cursor`
- `sql.delete_async`
- `sql.get_async`
- `sql.get_async_status`
- `sql.query`
- `sql.translate`
- `terms_enum`
- `termvectors`
- `synonyms.delete_synonym`
- `synonyms.delete_synonym_rule`
- `synonyms.get_synonym`
- `synonyms.get_synonym_rule`
- `synonyms.get_synonym_sets`
- `synonyms.put_synonym`
- `synonyms.put_synonym_rule`
- `license.get`
- `mtermvectors`
- `field_caps`
- `enrich`
- `graph.explore`
- `eql.delete`
- `eql.get`
- `eql.get_status`
- `eql.search`
- `ingest.delete_pipeline`
- `ingest.processor_grok`
- `ingest.put_pipeline`
- `ingest.simulate`
- `msearch_template`
- `render_search_template`
- `search_template`
- `search_application.delete`
- `search_application.get`
- `search_application.list`
- `search_application.put`
- `search_application.search`

## 0.0.7.20231031.pre

### API updates

New APIs in this release:

- `cluster.delete_component_template`
- `cluster.exists_component_template`
- `cluster.get_component_template`
- `cluster.info`
- `cluster.put_component_template`
- `delete_by_query`
- `exists_source`
- `get_source`
- `indices.delete_alias.rb`
- `indices.exists_alias.rb`
- `indices.get_alias.rb`
- `indices.put_alias.rb`
- `indices.update_aliases.rb`
- `security.authenticate`
- `security.create_api_key`
- `security.get_api_key`
- `security.invalidate_api_key`
- `security.query_api_keys`
- `update_by_query`
- `validate_query`

See [APIs](https://github.com/elastic/elasticsearch-serverless-ruby/blob/main/docs/apis.md) for the full list of available endpoints.

## 0.0.6.20230825.pre

- Updates User-Agent to `elasticsearch-serverless-ruby`.
- Adds `rescue_from_not_found` for `:ignore` parameter for API calls.

### API updates:

New APIs in this release:

- `async_search.delete`
- `async_search.get`
- `async_search.status`
- `async_search.submit`
- `clear_scroll`
- `creates`
- `exists`
- `indices.exists`
- `msearch`
- `mget`
- `scroll`
- `transform.delete_transform`
- `transform.get_transform`
- `transform.get_transform_stats`
- `transform.preview_transform`
- `transform.put_transform`
- `transform.reset_transform`
- `transform.schedule_now_transform`
- `transform.start_transform`
- `transform.stop_transform`
- `transform.update_transform`


## 0.0.5.20230808.pre

- Adds meta header and user agent values for Elasticsearch Serverless Client.

### API updates:

- 🐈 Adds cat APIs:
  * `cat.aliases`
  * `cat.component_templates`
  * `cat.count`
  * `cat.help`
  * `cat.transforms`
- Updates `indices` APIs (changes only in source code documentation).
- Adds `open_point_in_time` and `close_point_in_time` APIs.
- Adds `count` API.

## 0.0.4.20230724.pre

Tests semver with date version number.

API updates:
- Updates API generated code with new generator changes.
- Adds `indices.analyse`, `indices.get` APIs.
- Adds `cat` namespace, `cat.indices` API.

## 0.0.3.pre

- Adds `get` API.
- Adds namespace `indices` and APIs `indices.create`, `indices.delete`. Namespace support is implemented similar to how the Elasticsearch stack client [implements it](https://github.com/elastic/elasticsearch-ruby/tree/main/elasticsearch-api/lib/elasticsearch/api/namespace). But instead of creating a file with a `#{Namespace}Client` class per namespace,  I am dynamically generating them in runtime and including the namespaced methods. These are defined in `ElasticsearchServerless::API::#{module_name}::Actions` with metaprogramming. This works similar to the old client, but there's less manual work and by adding a namespace to `API_NAMESPACES`, it's automatically generated. Commit: [f97b2a47565f70a1278feba13fd625cbe2cb3134](https://github.com/elastic/elasticsearch-serverless-ruby/pull/13/commits/f97b2a47565f70a1278feba13fd625cbe2cb3134)
- Two new sections added to the getting started page: Getting a document and Deleting an index.

## 0.0.2.pre

Adds `index`, `update` and `delete` APIs.

## 0.0.1

First development release, not made publicly available, just for testing purposes.

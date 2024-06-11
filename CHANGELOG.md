# Changelog

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

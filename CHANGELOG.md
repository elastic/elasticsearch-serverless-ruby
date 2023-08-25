# Changelog

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

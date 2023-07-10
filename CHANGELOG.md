## 0.0.3.pre

- Adds `get` API.
- Adds namespace `indices` and APIs `indices.create`, `indices.delete`. Namespace support is implemented similar to how the Elasticsearch stack client [implements it](https://github.com/elastic/elasticsearch-ruby/tree/main/elasticsearch-api/lib/elasticsearch/api/namespace). But instead of creating a file with a `#{Namespace}Client` class per namespace,  I am dynamically generating them in runtime and including the namespaced methods. These are defined in `ElasticsearchServerless::API::#{module_name}::Actions` with metaprogramming. This works similar to the old client, but there's less manual work and by adding a namespace to `API_NAMESPACES`, it's automatically generated. Commit: [f97b2a47565f70a1278feba13fd625cbe2cb3134](https://github.com/elastic/elasticsearch-serverless-ruby/pull/13/commits/f97b2a47565f70a1278feba13fd625cbe2cb3134)
- Two new sections added to the getting started page: Getting a document and Deleting an index.

## 0.0.2.pre

Adds `index`, `update` and `delete` APIs.

## 0.0.1

First development release, not made publicly available, just for testing purposes.

# Elasticsearch Serverless Client

Build and install:
```bash
$ gem build elasticsearch-serverless.gemspec
$ gem install elasticsearch-serverless-x.x.x.gem
```

Use in console:
```bash
$ bundle exec rake console
> client = ElasticsearchServerless::Client.new
You initialized a client!
 => #<ElasticsearchServerless::Client:0x00007fabf381eec0>
```

## Run Tests

```bash
$ bundle exec rake spec
```

## Guide

Install the Elasticsearch Serverless Ruby Client:

```bash
$ gem build elasticsearch-serverless.gemspec
$ gem install elasticsearch-serverless-x.x.x.gem
```

Or include it in your Ruby project's Gemfile:

```ruby
gem 'elasticsearch-serverless'
```

In your Cloud deployment management page, copy the endpoint for Elasticsearch. Then create a new API Key and save its value:

![Create and copy Apy Key](docs/setup-api-key.gif "Create and copy Apy Key")

Instantiate a client with these values:

```ruby
client = ElasticsearchServerless::Client.new(
  api_key: 'QVd2ZmVZY0J2aFlZZlU5RWgxeFA6ejEzSGFueU1Tcy1pa3I5d2FQOU1vZw==',
  url: 'https://test-915089.es.europe-west2.gcp.elastic-cloud.com'
)
```

Now perform a request to check that you can connect to your Serverless server:

```ruby
client.perform_request('GET', '/')
 =>
#<Elastic::Transport::Transport::Response:0x00007f9031a7f418
 @body=
  {"name"=>"instance-0000000001",
   "cluster_name"=>"58a2d6ee777c4e9da68cee817c688b1e",
   "cluster_uuid"=>"ZcWCCIrbRyW4jgjZ2m06sw",
   "version"=>
    {"number"=>"8.7.0",
     "build_flavor"=>"default",
     "build_type"=>"docker",
     "build_hash"=>"09520b59b6bc1057340b55750186466ea715e30e",
     "build_date"=>"2023-03-27T16:31:09.816451435Z",
     "build_snapshot"=>false,
     "lucene_version"=>"9.5.0",
     "minimum_wire_compatibility_version"=>"7.17.0",
     "minimum_index_compatibility_version"=>"7.0.0"},
   "tagline"=>"You Know, for Search"},
 @headers=
  {"content-encoding"=>"gzip",
   "content-length"=>"346",
   "content-type"=>"application/json",
   "x-cloud-request-id"=>"2WqHAa3JRBi-gUFr7IyWfw",
   "x-elastic-product"=>"Elasticsearch",
   "x-found-handling-cluster"=>"58a2d6ee777c4e9da68cee817c688b1e",
   "x-found-handling-instance"=>"instance-0000000001",
   "date"=>"Thu, 13 Apr 2023 10:26:21 GMT"},
 @status=200> 
```

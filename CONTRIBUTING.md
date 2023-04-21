Clone the code, cd into the project directory and run `bundle install`.

### Run Tests

```bash
$ bundle exec rake spec
```

### Run Elasticsearch Serverless Docker container

We can run Elasticsearch in `serverless-mode` by setting `ES_JAVA_OPTS="-Des.serverless=true"` to a stateful Elasticsearch cluster. I've added a simplified version of clients' `run-elasticsearch.sh` script to the project, and it can be run with:

```bash
$ rake docker[STACK_VERSION]
```

If an API that is not available on Serverless is called, the following error is triggered:

```ruby
> client.info
/home/fernando/.rvm/gems/ruby-3.2.2/gems/elastic-transport-8.2.1/lib/elastic/transport/transport/base.rb:228:in `__raise_transport_error': [400] {"error":"uri [/] with method [GET] exists but is not available when running in serverless mode"} (Elastic::Transport::Transport::Errors::BadRequest) 
```

### Contributing Code Changes

1. Please make sure you have signed the [Contributor License
   Agreement](http://www.elastic.co/contributor-agreement/). We are not
   asking you to assign copyright to us, but to give us the right to distribute
   your code without restriction. We ask this of all contributors in order to
   assure our users of the origin and continuing existence of the code. You only
   need to sign the CLA once.
2. Rebase your changes. Update your local repository with the most recent code
   from the main `elasticsearch-serverless-ruby` repository and rebase your branch
   on top of the latest `main` branch.
3. Submit a pull request. Push your local changes to your forked repository
   and [submit a pull request](https://github.com/elastic/elasticsearch-serverless/pulls)
   and mention the issue number if any (`Closes #123`) Make sure that you
   add or modify tests related to your changes so that CI will pass.
4. Sit back and wait. There may be some discussion on your pull request and
   if changes are needed we would love to work with you to get your pull request
   merged into enterprise-search-ruby.

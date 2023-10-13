Clone the code, cd into the project directory and run `bundle install`.

## Run Tests

Unit tests:

```bash
$ bundle exec rake spec:unit
```

API tests - You need a running instance of Elasticsearch Serverless to run the API tests. You can set the credentials and endpoint in environment variables like so:

```bash
API_KEY=your_api_key ELASTICSEARCH_URL=your_serverless_url bundle exec rake spec:api
```

## Contributing Code Changes

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

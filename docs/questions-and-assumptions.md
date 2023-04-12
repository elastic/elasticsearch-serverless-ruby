# Questions and assumptions

## Initial questions

### Do we have a specification?
Not yet. For now we've decided to extract 3 APIs from the Elasticsearch spec and generate code based on that.

### How do we test against a running server?
Serverless is available in some QA instances in Cloud. Initially I'll test with Stack Elasticsearch with API Key authentication, and once available, with a Cloud instance of Serverless.

### Docs

An outcome of this work is I'm going to have to work with the docs team to create doc books for this client and tie that up together with the docs infra.

### YAML Tests

The Elasticsearch team is working on YAML tests.

### What Namespace should I use?

Some of the namespaces we use in our Ruby clients:
- `Elastic::EnterpriseSearch`
- `Elastic::EnterpriseSearch::AppSearch`
- `Elastic::EnterpriseSearch::WorkplaceSearch`
- `Elasticsearch::Client`
For this client I'm using `ElasticsearchServerless::Client` since I think it's the simplest one. I think something like `Elasticsearch::Serverless::Client` would just be more confusing to differentiate the Stack client from the Serverless client.

### Assumption: Regarding implementation of libraries:
In the Elasticsearch Ruby Client, elasticsearch and elasticsearch-api are two separate libraries. The whole client is elasticsearch, which requires elasticsearch-api (the generated API code). But you can also use the elasticsearch-api library on its own in your code. Josh told me in JS, it's all just one package. I see why it could make sense when it was built to have these separated in the Ruby client, but for Serverless, I'm going to assume we want to have just the one library which includes the client and the API generated code. At least that's how I'll build the prototype now and we can refactor for a different approach in the future. (edited) 

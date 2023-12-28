# Available APIs

These are the available APIs in the Elasticsearch Serverless Ruby client.


* `async_search.delete` - Deletes an async search by ID. If the search is still running, the search request will be cancelled. Otherwise, the saved search results are deleted.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/async-search.html
* `async_search.get` - Retrieves the results of a previously submitted async search request given its ID.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/async-search.html
* `async_search.status` - Retrieves the status of a previously submitted async search request given its ID.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/async-search.html
* `async_search.submit` - Executes a search request asynchronously.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/async-search.html
* `bulk` - Allows to perform multiple index/update/delete operations in a single request.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/docs-bulk.html
* `cat.aliases` - Shows information about currently configured aliases to indices including filter and routing infos.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-alias.html
* `cat.component_templates` - Returns information about existing component_templates templates.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/cat-component-templates.html
* `cat.count` - Provides quick access to the document count of the entire cluster, or individual indices.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-count.html
* `cat.help` - Returns help for the Cat APIs.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cat.html
* `cat.indices` - Returns information about indices: number of primaries and replicas, document counts, disk size, ...
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-indices.html
* `cat.ml_data_frame_analytics` - Gets configuration and usage information about data frame analytics jobs.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-dfanalytics.html
* `cat.ml_datafeeds` - Gets configuration and usage information about datafeeds.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-datafeeds.html
* `cat.ml_jobs` - Gets configuration and usage information about anomaly detection jobs.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-anomaly-detectors.html
* `cat.ml_trained_models` - Gets configuration and usage information about inference trained models.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-trained-model.html
* `cat.transforms` - Gets configuration and usage information about transforms.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-transforms.html
* `clear_scroll` - Explicitly clears the search context for a scroll.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/clear-scroll-api.html
* `close_point_in_time` - Close a point in time
 https://www.elastic.co/guide/en/elasticsearch/reference/current/point-in-time-api.html
* `cluster.delete_component_template` - Deletes a component template
 https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-component-template.html
* `cluster.exists_component_template` - Returns information about whether a particular component template exist
 https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-component-template.html
* `cluster.get_component_template` - Returns one or more component templates
 https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-component-template.html
* `cluster.info` - Returns different information about the cluster.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-info.html
* `cluster.put_component_template` - Creates or updates a component template
 https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-component-template.html
* `count` - Returns number of documents matching a query.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-count.html
* `create` - Creates a new document in the index.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-index_.html
* `delete` - Removes a document from the index.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-delete.html
* `delete_by_query` - Deletes documents matching the provided query.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-delete-by-query.html
* `delete_script` - Deletes a script.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/modules-scripting.html
* `enrich.delete_policy` - Deletes an existing enrich policy and its enrich index.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/delete-enrich-policy-api.html
* `enrich.execute_policy` - Creates the enrich index for an existing enrich policy.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/execute-enrich-policy-api.html
* `enrich.get_policy` - Gets information about an enrich policy.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/get-enrich-policy-api.html
* `enrich.put_policy` - Creates a new enrich policy.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/put-enrich-policy-api.html
* `enrich.stats` - Gets enrich coordinator statistics and information about enrich policies that are currently executing.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/enrich-stats-api.html
* `eql.delete` - Deletes an async EQL search by ID. If the search is still running, the search request will be cancelled. Otherwise, the saved search results are deleted.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/eql-search-api.html
* `eql.get` - Returns async results from previously executed Event Query Language (EQL) search
 https://www.elastic.co/guide/en/elasticsearch/reference/current/get-async-eql-search-api.html
* `eql.get_status` - Returns the status of a previously submitted async or stored Event Query Language (EQL) search
 https://www.elastic.co/guide/en/elasticsearch/reference/current/get-async-eql-status-api.html
* `eql.search` - Returns results matching a query expressed in Event Query Language (EQL)
 https://www.elastic.co/guide/en/elasticsearch/reference/current/eql-search-api.html
* `exists` - Returns information about whether a document exists in an index.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-get.html
* `exists_source` - Returns information about whether a document source exists in an index.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-get.html
* `explain` - Returns information about why a specific matches (or doesn't match) a query.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-explain.html
* `field_caps` - Returns the information about the capabilities of fields among multiple indices.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-field-caps.html
* `get` - Returns a document.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-get.html
* `get_script` - Returns a script.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/modules-scripting.html
* `get_source` - Returns the source of a document.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-get.html
* `graph.explore` - Explore extracted and summarized information about the documents and terms in an index.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/graph-explore-api.html
* `index` - Creates or updates a document in an index.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-index_.html
* `indices.add_block` - Adds a block to an index.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/index-modules-blocks.html
* `indices.analyze` - Performs the analysis process on a text and return the tokens breakdown of the text.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-analyze.html
* `indices.create` - Creates an index with optional settings and mappings.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-create-index.html
* `indices.create_data_stream` - Creates a data stream
 https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams.html
* `indices.data_streams_stats` - Provides statistics on operations happening in a data stream.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams.html
* `indices.delete` - Deletes an index.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-delete-index.html
* `indices.delete_alias` - Deletes an alias.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-aliases.html
* `indices.delete_data_lifecycle` - Deletes the data stream lifecycle of the selected data streams.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams-delete-lifecycle.html
* `indices.delete_data_stream` - Deletes a data stream.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams.html
* `indices.delete_index_template` - Deletes an index template.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-delete-template.html
* `indices.exists` - Returns information about whether a particular index exists.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-exists.html
* `indices.exists_alias` - Returns information about whether a particular alias exists.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-aliases.html
* `indices.exists_index_template` - Returns information about whether a particular index template exists.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/index-templates.html
* `indices.explain_data_lifecycle` - Retrieves information about the index's current data stream lifecycle, such as any potential encountered error, time since creation etc.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/data-streams-explain-lifecycle.html
* `indices.get` - Returns information about one or more indices.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-get-index.html
* `indices.get_alias` - Returns an alias.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-aliases.html
* `indices.get_data_lifecycle` - Returns the data stream lifecycle of the selected data streams.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams-get-lifecycle.html
* `indices.get_data_stream` - Returns data streams.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams.html
* `indices.get_index_template` - Returns an index template.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-get-template.html
* `indices.get_mapping` - Returns mappings for one or more indices.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-get-mapping.html
* `indices.get_settings` - Returns settings for one or more indices.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-get-settings.html
* `indices.migrate_to_data_stream` - Migrates an alias to a data stream
 https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams.html
* `indices.modify_data_stream` - Modifies a data stream
 https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams.html
* `indices.put_alias` - Creates or updates an alias.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-aliases.html
* `indices.put_data_lifecycle` - Updates the data stream lifecycle of the selected data streams.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams-put-lifecycle.html
* `indices.put_index_template` - Creates or updates an index template.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-put-template.html
* `indices.put_mapping` - Updates the index mappings.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-put-mapping.html
* `indices.put_settings` - Updates the index settings.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-update-settings.html
* `indices.refresh` - Performs the refresh operation in one or more indices.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-refresh.html
* `indices.resolve_index` - Returns information about any matching indices, aliases, and data streams
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-resolve-index-api.html
* `indices.rollover` - Updates an alias to point to a new index when the existing index
 https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-rollover-index.html
* `indices.simulate_index_template` - Simulate matching the given index name against the index templates in the system
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-simulate-index.html
* `indices.simulate_template` - Simulate resolving the given template name or body
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-simulate-template.html
* `indices.update_aliases` - Updates index aliases.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-aliases.html
* `indices.validate_query` - Allows a user to validate a potentially expensive query without executing it.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-validate.html
* `info` - Returns basic information about the cluster.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html
* `ingest.delete_pipeline` - Deletes a pipeline.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/delete-pipeline-api.html
* `ingest.get_pipeline` - Returns a pipeline.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/get-pipeline-api.html
* `ingest.processor_grok` - Returns a list of the built-in patterns.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/grok-processor.html
* `ingest.put_pipeline` - Creates or updates a pipeline.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ingest.html
* `ingest.simulate` - Allows to simulate a pipeline with example documents.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/simulate-pipeline-api.html
* `license.get` - Retrieves licensing information for the cluster
 https://www.elastic.co/guide/en/elasticsearch/reference/master/get-license.html
* `logstash.delete_pipeline` - Deletes Logstash Pipelines used by Central Management
 https://www.elastic.co/guide/en/elasticsearch/reference/current/logstash-api-delete-pipeline.html
* `logstash.get_pipeline` - Retrieves Logstash Pipelines used by Central Management
 https://www.elastic.co/guide/en/elasticsearch/reference/current/logstash-api-get-pipeline.html
* `logstash.put_pipeline` - Adds and updates Logstash Pipelines used for Central Management
 https://www.elastic.co/guide/en/elasticsearch/reference/current/logstash-api-put-pipeline.html
* `machine_learning.close_job` - Closes one or more anomaly detection jobs. A job can be opened and closed multiple times throughout its lifecycle.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-close-job.html
* `machine_learning.delete_calendar` - Deletes a calendar.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-delete-calendar.html
* `machine_learning.delete_calendar_event` - Deletes scheduled events from a calendar.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-delete-calendar-event.html
* `machine_learning.delete_calendar_job` - Deletes anomaly detection jobs from a calendar.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-delete-calendar-job.html
* `machine_learning.delete_data_frame_analytics` - Deletes an existing data frame analytics job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/delete-dfanalytics.html
* `machine_learning.delete_datafeed` - Deletes an existing datafeed.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-delete-datafeed.html
* `machine_learning.delete_filter` - Deletes a filter.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-delete-filter.html
* `machine_learning.delete_job` - Deletes an existing anomaly detection job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-delete-job.html
* `machine_learning.delete_trained_model` - Deletes an existing trained inference model that is currently not referenced by an ingest pipeline.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/delete-trained-models.html
* `machine_learning.delete_trained_model_alias` - Deletes a model alias that refers to the trained model
 https://www.elastic.co/guide/en/elasticsearch/reference/current/delete-trained-models-aliases.html
* `machine_learning.estimate_model_memory` - Estimates the model memory
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-apis.html
* `machine_learning.evaluate_data_frame` - Evaluates the data frame analytics for an annotated index.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/evaluate-dfanalytics.html
* `machine_learning.flush_job` - Forces any buffered data to be processed by the job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-flush-job.html
* `machine_learning.get_calendar_events` - Retrieves information about the scheduled events in calendars.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-get-calendar-event.html
* `machine_learning.get_calendars` - Retrieves configuration information for calendars.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-get-calendar.html
* `machine_learning.get_data_frame_analytics` - Retrieves configuration information for data frame analytics jobs.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/get-dfanalytics.html
* `machine_learning.get_data_frame_analytics_stats` - Retrieves usage information for data frame analytics jobs.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/get-dfanalytics-stats.html
* `machine_learning.get_datafeed_stats` - Retrieves usage information for datafeeds.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-get-datafeed-stats.html
* `machine_learning.get_datafeeds` - Retrieves configuration information for datafeeds.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-get-datafeed.html
* `machine_learning.get_filters` - Retrieves filters.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-get-filter.html
* `machine_learning.get_job_stats` - Retrieves usage information for anomaly detection jobs.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-get-job-stats.html
* `machine_learning.get_jobs` - Retrieves configuration information for anomaly detection jobs.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-get-job.html
* `machine_learning.get_overall_buckets` - Retrieves overall bucket results that summarize the bucket results of multiple anomaly detection jobs.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-get-overall-buckets.html
* `machine_learning.get_trained_models` - Retrieves configuration information for a trained inference model.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/get-trained-models.html
* `machine_learning.get_trained_models_stats` - Retrieves usage information for trained inference models.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/get-trained-models-stats.html
* `machine_learning.open_job` - Opens one or more anomaly detection jobs.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-open-job.html
* `machine_learning.post_calendar_events` - Posts scheduled events in a calendar.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-post-calendar-event.html
* `machine_learning.preview_data_frame_analytics` - Previews that will be analyzed given a data frame analytics config.
 http://www.elastic.co/guide/en/elasticsearch/reference/current/preview-dfanalytics.html
* `machine_learning.preview_datafeed` - Previews a datafeed.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-preview-datafeed.html
* `machine_learning.put_calendar` - Instantiates a calendar.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-put-calendar.html
* `machine_learning.put_calendar_job` - Adds an anomaly detection job to a calendar.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-put-calendar-job.html
* `machine_learning.put_data_frame_analytics` - Instantiates a data frame analytics job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/put-dfanalytics.html
* `machine_learning.put_datafeed` - Instantiates a datafeed.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-put-datafeed.html
* `machine_learning.put_filter` - Instantiates a filter.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-put-filter.html
* `machine_learning.put_job` - Instantiates an anomaly detection job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-put-job.html
* `machine_learning.put_trained_model` - Creates an inference trained model.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/put-trained-models.html
* `machine_learning.put_trained_model_alias` - Creates a new model alias (or reassigns an existing one) to refer to the trained model
 https://www.elastic.co/guide/en/elasticsearch/reference/current/put-trained-models-aliases.html
* `machine_learning.put_trained_model_definition_part` - Creates part of a trained model definition
 https://www.elastic.co/guide/en/elasticsearch/reference/current/put-trained-model-definition-part.html
* `machine_learning.put_trained_model_vocabulary` - Creates a trained model vocabulary
 https://www.elastic.co/guide/en/elasticsearch/reference/current/put-trained-model-vocabulary.html
* `machine_learning.reset_job` - Resets an existing anomaly detection job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-reset-job.html
* `machine_learning.start_data_frame_analytics` - Starts a data frame analytics job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/start-dfanalytics.html
* `machine_learning.start_datafeed` - Starts one or more datafeeds.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-start-datafeed.html
* `machine_learning.start_trained_model_deployment` - Start a trained model deployment.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/start-trained-model-deployment.html
* `machine_learning.stop_data_frame_analytics` - Stops one or more data frame analytics jobs.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/stop-dfanalytics.html
* `machine_learning.stop_datafeed` - Stops one or more datafeeds.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-stop-datafeed.html
* `machine_learning.stop_trained_model_deployment` - Stop a trained model deployment.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/stop-trained-model-deployment.html
* `machine_learning.update_data_frame_analytics` - Updates certain properties of a data frame analytics job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/update-dfanalytics.html
* `machine_learning.update_datafeed` - Updates certain properties of a datafeed.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-update-datafeed.html
* `machine_learning.update_filter` - Updates the description of a filter, adds items, or removes items.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-update-filter.html
* `machine_learning.update_job` - Updates certain properties of an anomaly detection job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-update-job.html
* `mget` - Allows to get multiple documents in one request.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-multi-get.html
* `msearch` - Allows to execute several search operations in one request.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-multi-search.html
* `msearch_template` - Allows to execute several search template operations in one request.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/search-multi-search.html
* `mtermvectors` - Returns multiple termvectors in one request.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-multi-termvectors.html
* `open_point_in_time` - Open a point in time that can be used in subsequent searches
 https://www.elastic.co/guide/en/elasticsearch/reference/current/point-in-time-api.html
* `ping` - Returns whether the cluster is running.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html
* `put_script` - Creates or updates a script.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/modules-scripting.html
* `query_ruleset.delete` - Deletes a query ruleset.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/delete-query-ruleset.html
* `query_ruleset.get` - Returns the details about a query ruleset.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/get-query-ruleset.html
* `query_ruleset.list` - Lists query rulesets.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/list-query-rulesets.html
* `query_ruleset.put` - Creates or updates a query ruleset.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/put-query-ruleset.html
* `rank_eval` - Allows to evaluate the quality of ranked search results over a set of typical search queries
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-rank-eval.html
* `reindex` - Allows to copy documents from one index to another, optionally filtering the source
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-reindex.html
* `render_search_template` - Allows to use the Mustache language to pre-render a search definition.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/render-search-template-api.html
* `scripts_painless_execute` - Allows an arbitrary script to be executed and a result to be returned
 https://www.elastic.co/guide/en/elasticsearch/painless/master/painless-execute-api.html
* `scroll` - Allows to retrieve a large numbers of results from a single search request.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-request-body.html#request-body-search-scroll
* `search` - Returns results matching a query.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-search.html
* `search_application.delete` - Deletes a search application.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/delete-search-application.html
* `search_application.delete_behavioral_analytics` - Delete a behavioral analytics collection.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/delete-analytics-collection.html
* `search_application.get` - Returns the details about a search application.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/get-search-application.html
* `search_application.get_behavioral_analytics` - Returns the existing behavioral analytics collections.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/list-analytics-collection.html
* `search_application.list` - Returns the existing search applications.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/list-search-applications.html
* `search_application.put` - Creates or updates a search application.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/put-search-application.html
* `search_application.put_behavioral_analytics` - Creates a behavioral analytics collection.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/put-analytics-collection.html
* `search_application.search` - Perform a search against a search application
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-application-search.html
* `search_mvt` - Searches a vector tile for geospatial values. Returns results as a binary Mapbox vector tile.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-vector-tile-api.html
* `search_template` - Allows to use the Mustache language to pre-render a search definition.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/search-template.html
* `security.authenticate` - Enables authentication as a user and retrieve information about the authenticated user.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-authenticate.html
* `security.create_api_key` - Creates an API key for access without requiring basic authentication.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-create-api-key.html
* `security.get_api_key` - Retrieves information for one or more API keys.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-get-api-key.html
* `security.has_privileges` - Determines whether the specified user has a specified list of privileges.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-has-privileges.html
* `security.invalidate_api_key` - Invalidates one or more API keys.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-invalidate-api-key.html
* `security.query_api_keys` - Retrieves information for API keys using a subset of query DSL
 https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-query-api-key.html
* `sql.clear_cursor` - Clears the SQL cursor
 https://www.elastic.co/guide/en/elasticsearch/reference/current/clear-sql-cursor-api.html
* `sql.delete_async` - Deletes an async SQL search or a stored synchronous SQL search. If the search is still running, the API cancels it.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/delete-async-sql-search-api.html
* `sql.get_async` - Returns the current status and available results for an async SQL search or stored synchronous SQL search
 https://www.elastic.co/guide/en/elasticsearch/reference/master/get-async-sql-search-api.html
* `sql.get_async_status` - Returns the current status of an async SQL search or a stored synchronous SQL search
 https://www.elastic.co/guide/en/elasticsearch/reference/master/get-async-sql-search-status-api.html
* `sql.query` - Executes a SQL request
 https://www.elastic.co/guide/en/elasticsearch/reference/current/sql-search-api.html
* `sql.translate` - Translates SQL into Elasticsearch queries
 https://www.elastic.co/guide/en/elasticsearch/reference/current/sql-translate-api.html
* `synonyms.delete_synonym` - Deletes a synonym set
 https://www.elastic.co/guide/en/elasticsearch/reference/master/delete-synonyms-set.html
* `synonyms.delete_synonym_rule` - Deletes a synonym rule in a synonym set
 https://www.elastic.co/guide/en/elasticsearch/reference/master/delete-synonym-rule.html
* `synonyms.get_synonym` - Retrieves a synonym set
 https://www.elastic.co/guide/en/elasticsearch/reference/master/get-synonyms-set.html
* `synonyms.get_synonym_rule` - Retrieves a synonym rule from a synonym set
 https://www.elastic.co/guide/en/elasticsearch/reference/master/get-synonym-rule.html
* `synonyms.get_synonyms_sets` - Retrieves a summary of all defined synonym sets
 https://www.elastic.co/guide/en/elasticsearch/reference/master/list-synonyms-sets.html
* `synonyms.put_synonym` - Creates or updates a synonyms set
 https://www.elastic.co/guide/en/elasticsearch/reference/master/put-synonyms-set.html
* `synonyms.put_synonym_rule` - Creates or updates a synonym rule in a synonym set
 https://www.elastic.co/guide/en/elasticsearch/reference/master/put-synonym-rule.html
* `terms_enum` - The terms enum API  can be used to discover terms in the index that begin with the provided string. It is designed for low-latency look-ups used in auto-complete scenarios.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/search-terms-enum.html
* `termvectors` - Returns information and statistics about terms in the fields of a particular document.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-termvectors.html
* `transform.delete_transform` - Deletes an existing transform.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/delete-transform.html
* `transform.get_transform` - Retrieves configuration information for transforms.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/get-transform.html
* `transform.get_transform_stats` - Retrieves usage information for transforms.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/get-transform-stats.html
* `transform.preview_transform` - Previews a transform.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/preview-transform.html
* `transform.put_transform` - Instantiates a transform.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/put-transform.html
* `transform.reset_transform` - Resets an existing transform.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/reset-transform.html
* `transform.schedule_now_transform` - Schedules now a transform.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/schedule-now-transform.html
* `transform.start_transform` - Starts one or more transforms.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/start-transform.html
* `transform.stop_transform` - Stops one or more transforms.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/stop-transform.html
* `transform.update_transform` - Updates certain properties of a transform.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/update-transform.html
* `update` - Updates a document with a script or partial document.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-update.html
* `update_by_query` - Performs an update on every document in the index without changing the source,
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-update-by-query.html
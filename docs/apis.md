# Available APIs

These are the available APIs in the Elasticsearch Serverless Ruby client.


* `async_search.delete` - Deletes an async search by identifier.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/async-search.html
* `async_search.get` - Retrieves the results of a previously submitted async search request given its identifier.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/async-search.html
* `async_search.status` - Get async search status
 https://www.elastic.co/guide/en/elasticsearch/reference/current/async-search.html
* `async_search.submit` - Runs a search request asynchronously.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/async-search.html
* `bulk` - Bulk index or delete documents.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/docs-bulk.html
* `cat.aliases` - Get aliases.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-alias.html
* `cat.component_templates` - Get component templates.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/cat-component-templates.html
* `cat.count` - Get a document count.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-count.html
* `cat.help` - Get CAT help.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cat.html
* `cat.indices` - Get index information.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-indices.html
* `cat.ml_data_frame_analytics` - Get data frame analytics jobs.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-dfanalytics.html
* `cat.ml_datafeeds` - Get datafeeds.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-datafeeds.html
* `cat.ml_jobs` - Get anomaly detection jobs.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-anomaly-detectors.html
* `cat.ml_trained_models` - Get trained models.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-trained-model.html
* `cat.transforms` - Get transforms.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-transforms.html
* `clear_scroll` - Clears the search context and results for a scrolling search.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/clear-scroll-api.html
* `close_point_in_time` - Closes a point-in-time.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/point-in-time-api.html
* `cluster.delete_component_template` - Delete component templates.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-component-template.html
* `cluster.exists_component_template` - Check component templates.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-component-template.html
* `cluster.get_component_template` - Get component templates.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-component-template.html
* `cluster.info` - Get cluster info.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-info.html
* `cluster.put_component_template` - Create or update a component template.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-component-template.html
* `connector.check_in` - Updates the last_seen field in the connector, and sets it to current timestamp
 https://www.elastic.co/guide/en/elasticsearch/reference/current/check-in-connector-api.html
* `connector.delete` - Deletes a connector.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/delete-connector-api.html
* `connector.get` - Retrieves a connector.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/get-connector-api.html
* `connector.list` - Returns existing connectors.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/list-connector-api.html
* `connector.post` - Creates a connector.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/create-connector-api.html
* `connector.put` - Creates or updates a connector.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/create-connector-api.html
* `connector.sync_job_cancel` - Cancels a connector sync job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/cancel-connector-sync-job-api.html
* `connector.sync_job_delete` - Deletes a connector sync job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/delete-connector-sync-job-api.html
* `connector.sync_job_get` - Retrieves a connector sync job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/get-connector-sync-job-api.html
* `connector.sync_job_list` - Lists connector sync jobs.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/list-connector-sync-jobs-api.html
* `connector.sync_job_post` - Creates a connector sync job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/create-connector-sync-job-api.html
* `connector.update_active_filtering` - Activates the valid draft filtering for a connector.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/update-connector-filtering-api.html
* `connector.update_api_key_id` - Updates the API key id in the connector document
 https://www.elastic.co/guide/en/elasticsearch/reference/current/update-connector-api-key-id-api.html
* `connector.update_configuration` - Updates the configuration field in the connector document
 https://www.elastic.co/guide/en/elasticsearch/reference/current/update-connector-configuration-api.html
* `connector.update_error` - Updates the filtering field in the connector document
 https://www.elastic.co/guide/en/elasticsearch/reference/current/update-connector-error-api.html
* `connector.update_filtering` - Updates the filtering field in the connector document
 https://www.elastic.co/guide/en/elasticsearch/reference/current/update-connector-filtering-api.html
* `connector.update_filtering_validation` - Updates the draft filtering validation info for a connector.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/update-connector-filtering-validation-api.html
* `connector.update_index_name` - Updates the index_name in the connector document
 https://www.elastic.co/guide/en/elasticsearch/reference/current/update-connector-index-name-api.html
* `connector.update_name` - Updates the name and description fields in the connector document
 https://www.elastic.co/guide/en/elasticsearch/reference/current/update-connector-name-description-api.html
* `connector.update_native` - Updates the is_native flag in the connector document
 https://www.elastic.co/guide/en/elasticsearch/reference/current/update-connector-native-api.html
* `connector.update_pipeline` - Updates the pipeline field in the connector document
 https://www.elastic.co/guide/en/elasticsearch/reference/current/update-connector-pipeline-api.html
* `connector.update_scheduling` - Updates the scheduling field in the connector document
 https://www.elastic.co/guide/en/elasticsearch/reference/current/update-connector-scheduling-api.html
* `connector.update_service_type` - Updates the service type of the connector
 https://www.elastic.co/guide/en/elasticsearch/reference/current/update-connector-service-type-api.html
* `connector.update_status` - Updates the status of the connector
 https://www.elastic.co/guide/en/elasticsearch/reference/current/update-connector-status-api.html
* `count` - Returns number of documents matching a query.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-count.html
* `create` - Index a document.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-index_.html
* `delete` - Delete a document.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-delete.html
* `delete_by_query` - Delete documents.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-delete-by-query.html
* `delete_script` - Delete a script or search template.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/modules-scripting.html
* `enrich.delete_policy` - Delete an enrich policy.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/delete-enrich-policy-api.html
* `enrich.execute_policy` - Creates the enrich index for an existing enrich policy.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/execute-enrich-policy-api.html
* `enrich.get_policy` - Get an enrich policy.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/get-enrich-policy-api.html
* `enrich.put_policy` - Create an enrich policy.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/put-enrich-policy-api.html
* `enrich.stats` - Get enrich stats.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/enrich-stats-api.html
* `eql.delete` - Deletes an async EQL search or a stored synchronous EQL search.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/eql-search-api.html
* `eql.get` - Returns the current status and available results for an async EQL search or a stored synchronous EQL search.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/get-async-eql-search-api.html
* `eql.get_status` - Returns the current status for an async EQL search or a stored synchronous EQL search without returning results.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/get-async-eql-status-api.html
* `eql.search` - Returns results matching a query expressed in Event Query Language (EQL)
 https://www.elastic.co/guide/en/elasticsearch/reference/current/eql-search-api.html
* `exists` - Check a document.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-get.html
* `exists_source` - Check for a document source.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-get.html
* `explain` - Explain a document match result.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-explain.html
* `field_caps` - The field capabilities API returns the information about the capabilities of fields among multiple indices.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-field-caps.html
* `get` - Get a document by its ID.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-get.html
* `get_script` - Get a script or search template.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/modules-scripting.html
* `get_source` - Get a document's source.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-get.html
* `graph.explore` - Extracts and summarizes information about the documents and terms in an Elasticsearch data stream or index.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/graph-explore-api.html
* `index` - Index a document.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-index_.html
* `indices.add_block` - Add an index block.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/index-modules-blocks.html
* `indices.analyze` - Performs analysis on a text string and returns the resulting tokens.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-analyze.html
* `indices.create` - Create an index.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-create-index.html
* `indices.create_data_stream` - Create a data stream.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams.html
* `indices.data_streams_stats` - Get data stream stats.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams.html
* `indices.delete` - Delete indices.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-delete-index.html
* `indices.delete_alias` - Delete an alias.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-aliases.html
* `indices.delete_data_lifecycle` - Delete data stream lifecycles.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams-delete-lifecycle.html
* `indices.delete_data_stream` - Delete data streams.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams.html
* `indices.delete_index_template` - Delete an index template.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-delete-template.html
* `indices.exists` - Check indices.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-exists.html
* `indices.exists_alias` - Check aliases.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-aliases.html
* `indices.exists_index_template` - Returns information about whether a particular index template exists.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/index-templates.html
* `indices.explain_data_lifecycle` - Get the status for a data stream lifecycle.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/data-streams-explain-lifecycle.html
* `indices.get` - Get index information.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-get-index.html
* `indices.get_alias` - Get aliases.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-aliases.html
* `indices.get_data_lifecycle` - Get data stream lifecycles.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams-get-lifecycle.html
* `indices.get_data_stream` - Get data streams.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams.html
* `indices.get_index_template` - Get index templates.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-get-template.html
* `indices.get_mapping` - Get mapping definitions.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-get-mapping.html
* `indices.get_settings` - Get index settings.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-get-settings.html
* `indices.migrate_to_data_stream` - Convert an index alias to a data stream.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams.html
* `indices.modify_data_stream` - Update data streams.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams.html
* `indices.put_alias` - Create or update an alias.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-aliases.html
* `indices.put_data_lifecycle` - Update data stream lifecycles.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/data-streams-put-lifecycle.html
* `indices.put_index_template` - Create or update an index template.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-put-template.html
* `indices.put_mapping` - Update field mappings.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-put-mapping.html
* `indices.put_settings` - Update index settings.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-update-settings.html
* `indices.put_template` - Create or update an index template.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-templates-v1.html
* `indices.refresh` - Refresh an index.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-refresh.html
* `indices.resolve_index` - Resolves the specified name(s) and/or index patterns for indices, aliases, and data streams.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-resolve-index-api.html
* `indices.rollover` - Roll over to a new index.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-rollover-index.html
* `indices.simulate_index_template` - Simulate an index.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-simulate-index.html
* `indices.simulate_template` - Simulate an index template.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-simulate-template.html
* `indices.update_aliases` - Create or update an alias.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-aliases.html
* `indices.validate_query` - Validate a query.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-validate.html
* `inference.delete` - Delete an inference endpoint
 https://www.elastic.co/guide/en/elasticsearch/reference/master/delete-inference-api.html
* `inference.get` - Get an inference endpoint
 https://www.elastic.co/guide/en/elasticsearch/reference/master/get-inference-api.html
* `inference.inference` - Perform inference on the service
 https://www.elastic.co/guide/en/elasticsearch/reference/master/post-inference-api.html
* `inference.put` - Create an inference endpoint
 https://www.elastic.co/guide/en/elasticsearch/reference/master/put-inference-api.html
* `info` - Get cluster info.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html
* `ingest.delete_pipeline` - Deletes one or more existing ingest pipeline.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/delete-pipeline-api.html
* `ingest.get_pipeline` - Returns information about one or more ingest pipelines.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/get-pipeline-api.html
* `ingest.processor_grok` - Extracts structured fields out of a single text field within a document.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/grok-processor.html
* `ingest.put_pipeline` - Creates or updates an ingest pipeline.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ingest.html
* `ingest.simulate` - Executes an ingest pipeline against a set of provided documents.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/simulate-pipeline-api.html
* `license.get` - Get license information.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/get-license.html
* `logstash.delete_pipeline` - Deletes a pipeline used for Logstash Central Management.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/logstash-api-delete-pipeline.html
* `logstash.get_pipeline` - Retrieves pipelines used for Logstash Central Management.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/logstash-api-get-pipeline.html
* `logstash.put_pipeline` - Creates or updates a pipeline used for Logstash Central Management.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/logstash-api-put-pipeline.html
* `machine_learning.close_job` - Close anomaly detection jobs.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-close-job.html
* `machine_learning.delete_calendar` - Delete a calendar.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-delete-calendar.html
* `machine_learning.delete_calendar_event` - Delete events from a calendar.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-delete-calendar-event.html
* `machine_learning.delete_calendar_job` - Delete anomaly jobs from a calendar.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-delete-calendar-job.html
* `machine_learning.delete_data_frame_analytics` - Delete a data frame analytics job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/delete-dfanalytics.html
* `machine_learning.delete_datafeed` - Delete a datafeed.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-delete-datafeed.html
* `machine_learning.delete_filter` - Delete a filter.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-delete-filter.html
* `machine_learning.delete_job` - Delete an anomaly detection job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-delete-job.html
* `machine_learning.delete_trained_model` - Delete an unreferenced trained model.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/delete-trained-models.html
* `machine_learning.delete_trained_model_alias` - Delete a trained model alias.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/delete-trained-models-aliases.html
* `machine_learning.estimate_model_memory` - Estimate job model memory usage.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-apis.html
* `machine_learning.evaluate_data_frame` - Evaluate data frame analytics.
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
* `machine_learning.get_overall_buckets` - Retrieves overall bucket results that summarize the bucket results of
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-get-overall-buckets.html
* `machine_learning.get_trained_models` - Retrieves configuration information for a trained model.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/get-trained-models.html
* `machine_learning.get_trained_models_stats` - Retrieves usage information for trained models. You can get usage information for multiple trained
 https://www.elastic.co/guide/en/elasticsearch/reference/current/get-trained-models-stats.html
* `machine_learning.infer_trained_model` - Evaluates a trained model.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/infer-trained-model.html
* `machine_learning.open_job` - Open anomaly detection jobs.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-open-job.html
* `machine_learning.post_calendar_events` - Adds scheduled events to a calendar.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-post-calendar-event.html
* `machine_learning.preview_data_frame_analytics` - Previews the extracted features used by a data frame analytics config.
 http://www.elastic.co/guide/en/elasticsearch/reference/current/preview-dfanalytics.html
* `machine_learning.preview_datafeed` - Previews a datafeed.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-preview-datafeed.html
* `machine_learning.put_calendar` - Creates a calendar.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-put-calendar.html
* `machine_learning.put_calendar_job` - Adds an anomaly detection job to a calendar.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-put-calendar-job.html
* `machine_learning.put_data_frame_analytics` - Instantiates a data frame analytics job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/put-dfanalytics.html
* `machine_learning.put_datafeed` - Instantiates a datafeed.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-put-datafeed.html
* `machine_learning.put_filter` - Instantiates a filter.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-put-filter.html
* `machine_learning.put_job` - Create an anomaly detection job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-put-job.html
* `machine_learning.put_trained_model` - Enables you to supply a trained model that is not created by data frame analytics.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/put-trained-models.html
* `machine_learning.put_trained_model_alias` - Creates or updates a trained model alias. A trained model alias is a logical
 https://www.elastic.co/guide/en/elasticsearch/reference/current/put-trained-models-aliases.html
* `machine_learning.put_trained_model_definition_part` - Creates part of a trained model definition.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/put-trained-model-definition-part.html
* `machine_learning.put_trained_model_vocabulary` - Creates a trained model vocabulary.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/put-trained-model-vocabulary.html
* `machine_learning.reset_job` - Resets an anomaly detection job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-reset-job.html
* `machine_learning.start_data_frame_analytics` - Starts a data frame analytics job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/start-dfanalytics.html
* `machine_learning.start_datafeed` - Starts one or more datafeeds.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-start-datafeed.html
* `machine_learning.start_trained_model_deployment` - Starts a trained model deployment, which allocates the model to every machine learning node.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/start-trained-model-deployment.html
* `machine_learning.stop_data_frame_analytics` - Stops one or more data frame analytics jobs.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/stop-dfanalytics.html
* `machine_learning.stop_datafeed` - Stops one or more datafeeds.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-stop-datafeed.html
* `machine_learning.stop_trained_model_deployment` - Stops a trained model deployment.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/stop-trained-model-deployment.html
* `machine_learning.update_data_frame_analytics` - Updates an existing data frame analytics job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/update-dfanalytics.html
* `machine_learning.update_datafeed` - Updates the properties of a datafeed.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-update-datafeed.html
* `machine_learning.update_filter` - Updates the description of a filter, adds items, or removes items from the list.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-update-filter.html
* `machine_learning.update_job` - Updates certain properties of an anomaly detection job.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-update-job.html
* `machine_learning.update_trained_model_deployment` - Starts a trained model deployment, which allocates the model to every machine learning node.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/update-trained-model-deployment.html
* `mget` - Allows to get multiple documents in one request.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-multi-get.html
* `msearch` - Allows to execute several search operations in one request.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-multi-search.html
* `msearch_template` - Runs multiple templated searches with a single request.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/search-multi-search.html
* `mtermvectors` - Returns multiple termvectors in one request.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-multi-termvectors.html
* `open_point_in_time` - A search request by default executes against the most recent visible data of the target indices,
 https://www.elastic.co/guide/en/elasticsearch/reference/current/point-in-time-api.html
* `ping` - Ping the cluster.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html
* `put_script` - Create or update a script or search template.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/modules-scripting.html
* `query_rules.delete_rule` - Deletes a query rule within a query ruleset.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/delete-query-rule.html
* `query_rules.delete_ruleset` - Deletes a query ruleset.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/delete-query-ruleset.html
* `query_rules.get_rule` - Returns the details about a query rule within a query ruleset
 https://www.elastic.co/guide/en/elasticsearch/reference/master/get-query-rule.html
* `query_rules.get_ruleset` - Returns the details about a query ruleset
 https://www.elastic.co/guide/en/elasticsearch/reference/master/get-query-ruleset.html
* `query_rules.list_rulesets` - Returns summarized information about existing query rulesets.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/list-query-rulesets.html
* `query_rules.put_rule` - Creates or updates a query rule within a query ruleset.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/put-query-rule.html
* `query_rules.put_ruleset` - Creates or updates a query ruleset.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/put-query-ruleset.html
* `rank_eval` - Enables you to evaluate the quality of ranked search results over a set of typical search queries.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-rank-eval.html
* `reindex` - Reindex documents.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-reindex.html
* `render_search_template` - Renders a search template as a search request body.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/render-search-template-api.html
* `scripts_painless_execute` - Run a script.
 https://www.elastic.co/guide/en/elasticsearch/painless/master/painless-execute-api.html
* `scroll` - Allows to retrieve a large numbers of results from a single search request.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-request-body.html#request-body-search-scroll
* `search` - Returns search hits that match the query defined in the request.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-search.html
* `search_application.delete` - Deletes a search application.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/delete-search-application.html
* `search_application.delete_behavioral_analytics` - Delete a behavioral analytics collection.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/delete-analytics-collection.html
* `search_application.get` - Returns the details about a search application
 https://www.elastic.co/guide/en/elasticsearch/reference/master/get-search-application.html
* `search_application.get_behavioral_analytics` - Returns the existing behavioral analytics collections.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/list-analytics-collection.html
* `search_application.list` - Returns the existing search applications.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/list-search-applications.html
* `search_application.put` - Creates or updates a search application.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/put-search-application.html
* `search_application.put_behavioral_analytics` - Creates a behavioral analytics collection.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/put-analytics-collection.html
* `search_application.search` - Perform a search against a search application.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-application-search.html
* `search_mvt` - Search a vector tile.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/search-vector-tile-api.html
* `search_template` - Runs a search with a search template.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/search-template.html
* `security.authenticate` - Authenticate a user.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-authenticate.html
* `security.create_api_key` - Create an API key.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-create-api-key.html
* `security.get_api_key` - Get API key information.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-get-api-key.html
* `security.has_privileges` - Check user privileges.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-has-privileges.html
* `security.invalidate_api_key` - Invalidate API keys.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-invalidate-api-key.html
* `security.query_api_keys` - Query API keys.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-query-api-key.html
* `security.update_api_key` - Update an API key.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-update-api-key.html
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
* `synonyms.put_synonym` - Creates or updates a synonym set.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/put-synonyms-set.html
* `synonyms.put_synonym_rule` - Creates or updates a synonym rule in a synonym set
 https://www.elastic.co/guide/en/elasticsearch/reference/master/put-synonym-rule.html
* `tasks.get` - Get task information.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/tasks.html
* `terms_enum` - The terms enum API  can be used to discover terms in the index that begin with the provided string. It is designed for low-latency look-ups used in auto-complete scenarios.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/search-terms-enum.html
* `termvectors` - Get term vector information.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-termvectors.html
* `transform.delete_transform` - Delete a transform.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/delete-transform.html
* `transform.get_transform` - Get transforms.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/get-transform.html
* `transform.get_transform_stats` - Get transform stats.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/get-transform-stats.html
* `transform.preview_transform` - Preview a transform.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/preview-transform.html
* `transform.put_transform` - Create a transform.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/put-transform.html
* `transform.reset_transform` - Reset a transform.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/reset-transform.html
* `transform.schedule_now_transform` - Schedule a transform to start now.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/schedule-now-transform.html
* `transform.start_transform` - Start a transform.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/start-transform.html
* `transform.stop_transform` - Stop transforms.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/stop-transform.html
* `transform.update_transform` - Update a transform.
 https://www.elastic.co/guide/en/elasticsearch/reference/current/update-transform.html
* `update` - Update a document.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-update.html
* `update_by_query` - Update documents.
 https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-update-by-query.html
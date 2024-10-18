# resource "databricks_sql_endpoint" "sql_cluster_general" {
#   name                      = "2xS-serverless"
#   cluster_size              = "2X-Small"
#   max_num_clusters          = 1
#   enable_serverless_compute = true
#   auto_stop_mins            = 10
#   warehouse_type            = "PRO"
# }

# resource "databricks_sql_global_config" "this" {
#   data_access_config = {
#     "spark.hadoop.fs.azure.account.auth.type" : "OAuth",
#     "spark.hadoop.fs.azure.account.oauth.provider.type" : "org.apache.hadoop.fs.azurebfs.oauth2.ClientCredsTokenProvider",
#     "spark.hadoop.fs.azure.account.oauth2.client.id" : "{{secrets/${databricks_secret_scope.this.name}/spn-data-reader-client-id}}",
#     "spark.hadoop.fs.azure.account.oauth2.client.secret" : "{{secrets/${databricks_secret_scope.this.name}/spn-data-reader-client-secret}}",
#     "spark.hadoop.fs.azure.account.oauth2.client.endpoint" : "https://login.microsoftonline.com/${data.azurerm_client_config.current.tenant_id}/oauth2/token"
#   }
#   sql_config_params = {
#     "ANSI_MODE" : "true"
#   }
# }

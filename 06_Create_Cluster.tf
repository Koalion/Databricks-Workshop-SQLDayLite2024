# # data "databricks_node_type" "smallest" {}

# data "databricks_spark_version" "lts" {
#   long_term_support = true
#   ml                = false
# }

# resource "databricks_cluster" "this" {
#   cluster_name            = "Cluster"
#   spark_version           = data.databricks_spark_version.lts.id
#   node_type_id            = "Standard_DS3_v2"
#   autotermination_minutes = 15
#   data_security_mode      = "USER_ISOLATION"
#   driver_node_type_id     = "Standard_DS3_v2"
#   num_workers             = 1

#   azure_attributes {
#     availability       = "SPOT_WITH_FALLBACK_AZURE"
#     first_on_demand    = 1
#     spot_bid_max_price = -1
#   }
#   #   spark_conf = {
#   #     "spark.hadoop.fs.azure.account.auth.type.${data.azurerm_storage_account.this.name}.dfs.core.windows.net" : "OAuth",
#   #     "spark.hadoop.fs.azure.account.oauth.provider.type.${data.azurerm_storage_account.this.name}.dfs.core.windows.net" : "org.apache.hadoop.fs.azurebfs.oauth2.ClientCredsTokenProvider",
#   #     "spark.hadoop.fs.azure.account.oauth2.client.id.${data.azurerm_storage_account.this.name}.dfs.core.windows.net" : "{{secrets/${databricks_secret_scope.this.name}/spn-data-reader-client-id}}",
#   #     "spark.hadoop.fs.azure.account.oauth2.client.secret.${data.azurerm_storage_account.this.name}.dfs.core.windows.net" : "{{secrets/${databricks_secret_scope.this.name}/spn-data-reader-client-secret}}",
#   #     "spark.hadoop.fs.azure.account.oauth2.client.endpoint.${data.azurerm_storage_account.this.name}.dfs.core.windows.net" : "https://login.microsoftonline.com/${data.azurerm_client_config.current.tenant_id}/oauth2/token"

#   #   }
# }

# # resource "databricks_permissions" "test_user" {
# #   cluster_id = databricks_cluster.this.id

# #   access_control {
# #     user_name        = databricks_user.test_user.display_name
# #     permission_level = "CAN_ATTACH_TO"
# #   }
# # }

# data "databricks_current_user" "me" {}

# resource "databricks_notebook" "demo_06" {
#   source = "${path.module}/notebooks/06_Create_Cluster.py"
#   path   = "${data.databricks_current_user.me.home}/06_Create_Cluster.py"
# }

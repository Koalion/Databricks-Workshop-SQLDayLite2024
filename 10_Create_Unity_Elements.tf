# resource "databricks_storage_credential" "this" {
#   name    = "adb-acc-con-${local.sufix}"
#   comment = "Managed by TF. Do not modify."

#   azure_managed_identity {
#     access_connector_id = azurerm_databricks_access_connector.this.id
#   }
# }

# resource "databricks_external_location" "this" {
#   name            = "external-${local.sufix}"
#   url             = "abfss://${local.sufix}@${local.storage_account_name}.dfs.core.windows.net/"
#   credential_name = databricks_storage_credential.this.name
#   comment         = "Managed by TF. Please do not modify."
#   depends_on = [
#     azurerm_role_assignment.access_connector_to_storage
#   ]
# }

# resource "databricks_catalog" "this" {
#   name           = "catalog-${local.sufix}"
#   storage_root   = databricks_external_location.this.url
#   comment        = "This catalog is managed by Terraform. Please do not modify."
#   isolation_mode = "ISOLATED"
#   depends_on = [
#     databricks_external_location.this
#   ]
# }

# resource "databricks_schema" "this" {
#   name         = "schema-${local.sufix}"
#   catalog_name = databricks_catalog.this.name
#   comment      = "This database is managed by terraform. Please do not modify."

#   depends_on = [
#     databricks_external_location.this,
#     databricks_catalog.this
#   ]
# }

# resource "databricks_notebook" "demo_10" {
#   source = "${path.module}/notebooks/10_Create_Unity_Elements.py"
#   path   = "${data.databricks_current_user.me.home}/10_Create_Unity_Elements.py"
# }

# resource "databricks_external_location" "volume" {
#   name            = "external-${local.sufix}-volume"
#   url             = "abfss://${local.sufix}-volume@${local.storage_account_name}.dfs.core.windows.net/"
#   credential_name = databricks_storage_credential.this.name
#   comment         = "Managed by TF. Please do not modify."
#   depends_on = [
#     azurerm_role_assignment.access_connector_to_storage
#   ]
# }

# resource "databricks_volume" "this" {
#   name             = "volume-${local.sufix}"
#   catalog_name     = databricks_catalog.this.name
#   schema_name      = databricks_schema.this.name
#   volume_type      = "EXTERNAL"
#   storage_location = databricks_external_location.volume.url
#   comment          = "This volume is managed by Terraform. Please do not modify."
# }

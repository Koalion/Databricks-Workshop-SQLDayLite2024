# resource "azurerm_databricks_access_connector" "this" {
#   name                = "adb-acc-con-${local.sufix}"
#   location            = local.location
#   resource_group_name = data.azurerm_resource_group.this.name
#   identity {
#     type = "SystemAssigned"
#   }
# }

# resource "azurerm_role_assignment" "access_connector_to_storage" {
#   scope                = data.azurerm_storage_account.this.id
#   role_definition_name = "Storage Blob Data Contributor"
#   principal_id         = azurerm_databricks_access_connector.this.identity[0].principal_id
# }

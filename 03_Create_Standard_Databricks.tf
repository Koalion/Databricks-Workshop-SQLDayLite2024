# resource "azurerm_databricks_workspace" "standard" {
#   name                          = "dbw-${local.sufix}-standard"
#   location                      = local.location
#   resource_group_name           = data.azurerm_resource_group.this.name
#   sku                           = "standard"
#   public_network_access_enabled = true
#   managed_resource_group_name   = "databricks-rg-${data.azurerm_resource_group.this.name}-standard"
# }

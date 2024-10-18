data "azurerm_resource_group" "operations" {
  name = "rg-operations"
}

data "azurerm_resource_group" "this" {
  name = "rg-${local.login}"
}

data "azurerm_virtual_network" "this" {
  name                = "vnet-operations"
  resource_group_name = data.azurerm_resource_group.operations.name
}

data "azurerm_key_vault" "this" {
  name                = "kv-operations-qnoryh"
  resource_group_name = data.azurerm_resource_group.operations.name
}

data "azurerm_storage_account" "this" {
  name                = "adloperationsqnoryh"
  resource_group_name = data.azurerm_resource_group.operations.name

}

data "azurerm_subnet" "public_dbr" {
  name                 = "${local.sufix}-DatabricksPublic"
  virtual_network_name = "vnet-operations"
  resource_group_name  = data.azurerm_resource_group.operations.name
}

data "azurerm_subnet" "private_dbr" {
  name                 = "${local.sufix}-DatabricksPrivate"
  virtual_network_name = "vnet-operations"
  resource_group_name  = data.azurerm_resource_group.operations.name
}

data "azurerm_client_config" "current" {}

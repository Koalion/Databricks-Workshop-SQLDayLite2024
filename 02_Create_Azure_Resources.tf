resource "azurerm_databricks_workspace" "this" {
  name                          = "dbw-${local.sufix}"
  location                      = local.location
  resource_group_name           = data.azurerm_resource_group.this.name
  sku                           = "premium"
  public_network_access_enabled = true
  custom_parameters {
    virtual_network_id                                   = data.azurerm_virtual_network.this.id
    public_subnet_name                                   = data.azurerm_subnet.public_dbr.name
    private_subnet_name                                  = data.azurerm_subnet.private_dbr.name
    public_subnet_network_security_group_association_id  = data.azurerm_subnet.public_dbr.id
    private_subnet_network_security_group_association_id = data.azurerm_subnet.private_dbr.id

  }
}

resource "azurerm_data_factory" "this" {
  name                = "adf-${local.sufix}"
  location            = local.location
  resource_group_name = data.azurerm_resource_group.this.name
  identity {
    type = "SystemAssigned"
  }
}

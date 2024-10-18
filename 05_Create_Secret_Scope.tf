# resource "databricks_secret_scope" "this" {
#   name                     = data.azurerm_key_vault.this.name
#   initial_manage_principal = "users"
#   keyvault_metadata {
#     resource_id = data.azurerm_key_vault.this.id
#     dns_name    = data.azurerm_key_vault.this.vault_uri
#   }
# }

# resource "databricks_user" "test_user" {
#   user_name = local.test_user_login
# }

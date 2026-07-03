resource "azurerm_storage_account" "sa" {
  name                            = var.name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  account_kind                    = "StorageV2"
  min_tls_version                 = var.min_tls_version
  allow_nested_items_to_be_public = false
  public_network_access_enabled   = true
  tags                            = var.tags
}

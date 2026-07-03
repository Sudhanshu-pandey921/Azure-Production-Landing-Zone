resource "azurerm_resource_group" "rg1" {
  name     = var.rg
  location = var.location
  tags     = var.tags
}

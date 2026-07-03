resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

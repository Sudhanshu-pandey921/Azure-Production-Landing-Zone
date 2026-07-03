resource "azurerm_network_security_group" "nsg1" {
  for_each = var.nsgs

  name                = each.value.name
  location            = var.location
  resource_group_name = var.resource_group_name
  
  security_rule {
    name                       = "AllowGatewayManager"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"

    source_port_range          = "*"
    destination_port_ranges    = ["65200-65535"]

    source_address_prefix      = "GatewayManager"
    destination_address_prefix = "*"
  }

  tags = var.tags
}

output "ids" {
  description = "The IDs of the NSGs."
  value = {
    for key, nsg in azurerm_network_security_group.nsg1 : key => nsg.id
  }
}

output "names" {
  description = "The names of the NSGs."
  value = {
    for key, nsg in azurerm_network_security_group.nsg1 : key => nsg.name
  }
}

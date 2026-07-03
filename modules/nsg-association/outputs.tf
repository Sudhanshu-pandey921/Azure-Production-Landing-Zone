output "ids" {
  description = "The IDs of the NSG associations."
  value = {
    for association_key, association in azurerm_subnet_network_security_group_association.nsg-asso : association_key => association.id
  }
}

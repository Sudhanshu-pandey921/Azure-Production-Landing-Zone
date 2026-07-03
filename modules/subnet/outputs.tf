output "ids" {
  description = "The IDs of the subnets."
  value = {
    for subnet_key, subnet in azurerm_subnet.subnet1 : subnet_key => subnet.id
  }
}

output "names" {
  description = "The names of the subnets."
  value = {
    for subnet_key, subnet in azurerm_subnet.subnet1 : subnet_key => subnet.name
  }

}

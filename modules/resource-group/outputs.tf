output "id" {
  description = "The ID of the resource group."
  value       = azurerm_resource_group.rg1.id
}

output "name" {
  description = "The name of the resource group."
  value       = azurerm_resource_group.rg1.name
}

output "ids" {
  description = "Map of created route table IDs."
  value       = { for k, v in azurerm_route_table.rt : k => v.id }
}

output "names" {
  description = "Map of created route table names."
  value       = { for k, v in azurerm_route_table.rt : k => v.name }
}

output "ids" {
  description = "Map of created public IP IDs."
  value       = { for k, v in azurerm_public_ip.pip : k => v.id }
}

output "names" {
  description = "Map of created public IP names."
  value       = { for k, v in azurerm_public_ip.pip : k => v.name }
}

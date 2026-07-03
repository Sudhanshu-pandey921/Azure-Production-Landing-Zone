output "id" {
  description = "ID of the Application Gateway."
  value       = azurerm_application_gateway.agw.id
}

output "name" {
  description = "Name of the Application Gateway."
  value       = azurerm_application_gateway.agw.name
}

output "id" {
  description = "The ID of the managed identity."
  value       = azurerm_user_assigned_identity.this.id
}

output "name" {
  description = "The name of the managed identity."
  value       = azurerm_user_assigned_identity.this.name
}

output "principal_id" {
  description = "The principal ID of the managed identity."
  value       = azurerm_user_assigned_identity.this.principal_id
}

output "id" {
  description = "ID of the VMSS."
  value       = azurerm_linux_virtual_machine_scale_set.vmss.id
}

output "name" {
  description = "Name of the VMSS."
  value       = azurerm_linux_virtual_machine_scale_set.vmss.name
}

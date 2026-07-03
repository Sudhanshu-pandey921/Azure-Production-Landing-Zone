output "resource_group_id" {
  description = "The ID of the shared resource group."
  value       = module.resource_group.id
}

output "virtual_network_id" {
  description = "The ID of the virtual network."
  value       = module.virtual_network.id
}

output "subnet_ids" {
  description = "The created subnet IDs."
  value       = module.subnets.ids
}

output "nsg_ids" {
  description = "The created NSG IDs."
  value       = module.nsgs.ids
}

output "route_table_ids" {
  description = "The created route table IDs."
  value       = module.route_tables.ids
}

output "public_ip_ids" {
  description = "The created public IP IDs."
  value       = module.public_ips.ids
}

output "application_gateway_id" {
  description = "The ID of the Application Gateway."
  value       = try(module.application_gateway[0].id, null)
}

output "storage_account_id" {
  description = "The ID of the storage account."
  value       = try(module.storage_account[0].id, null)
}

output "sql_database_ids" {
  description = "The IDs of the SQL server and database."
  value = {
    server_id   = try(module.sql_database[0].server_id, null)
    database_id = try(module.sql_database[0].database_id, null)
  }
}

output "vmss_id" {
  description = "The ID of the VMSS."
  value       = try(module.vmss[0].id, null)
}

output "managed_identity_id" {
  description = "The ID of the managed identity."
  value       = try(module.managed_identity[0].id, null)
}

output "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace."
  value       = try(module.log_analytics[0].id, null)
}


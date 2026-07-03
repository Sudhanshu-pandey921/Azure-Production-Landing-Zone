output "server_id" {
  description = "ID of the SQL server."
  value       = azurerm_mssql_server.sql_server.id
}

output "database_id" {
  description = "ID of the SQL database."
  value       = azurerm_mssql_database.sql_db.id
}

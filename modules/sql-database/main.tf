resource "azurerm_mssql_server" "sql_server" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = var.minimum_tls_version
  tags                         = var.tags
}

resource "azurerm_mssql_database" "sql_db" {
  name      = var.database_name
  server_id = azurerm_mssql_server.sql_server.id
  sku_name  = var.sku_name
  tags      = var.tags
}

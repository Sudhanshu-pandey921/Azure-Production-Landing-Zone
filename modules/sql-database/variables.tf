variable "server_name" {
  description = "Name of the SQL server."
  type        = string
}

variable "database_name" {
  description = "Name of the SQL database."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where the SQL resources will be created."
  type        = string
}

variable "location" {
  description = "Azure region for the SQL resources."
  type        = string
}

variable "sql_version" {
  description = "Version of the SQL server."
  type        = string
  default     = "12.0"
}

variable "administrator_login" {
  description = "Administrator login for the SQL server."
  type        = string
}

variable "administrator_login_password" {
  description = "Administrator password for the SQL server."
  type        = string
  sensitive   = true
}

variable "minimum_tls_version" {
  description = "Minimum TLS version for the SQL server."
  type        = string
  default     = "1.2"
}

variable "sku_name" {
  description = "SKU for the SQL database."
  type        = string
  default     = "Basic"
}

variable "tags" {
  description = "Tags to apply to the SQL resources."
  type        = map(string)
  default     = {}
}

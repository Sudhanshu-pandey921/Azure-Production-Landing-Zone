variable "environment" {
  description = "Environment name (e.g., dev, test, prod)."
  type        = string
}

variable "location" {
  description = "Azure region for the landing zone resources."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the shared resource group."
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network."
  type        = string
}

variable "virtual_network_address_space" {
  description = "Address space for the virtual network."
  type        = list(string)
}

variable "subnets" {
  description = "Map of subnets to create."
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
  default = {}
}

variable "nsgs" {
  description = "Map of network security groups to create."
  type = map(object({
    name = string
  }))
  default = {}
}

variable "nsg_associations" {
  description = "Map of subnet-to-NSG associations."
  type = map(object({
    subnet_key = string
    nsg_key    = string
  }))
  default = {}
}

variable "route_tables" {
  description = "Map of route tables to create."
  type = map(object({
    name = string
    routes = list(object({
      name                   = string
      address_prefix         = string
      next_hop_type          = string
      next_hop_in_ip_address = optional(string)
    }))
  }))
  default = {}
}

variable "public_ips" {
  description = "Map of public IPs to create."
  type = map(object({
    name              = string
    allocation_method = string
    sku               = string
    zones             = optional(list(string), [])
  }))
  default = {}
}

variable "application_gateway" {
  description = "Configuration for the Application Gateway."
  type = object({
    name                           = string
    subnet_id                      = optional(string)
    public_ip_address_id           = optional(string)
    subnet_key                     = optional(string)
    public_ip_key                  = optional(string)
    sku_name                       = optional(string, "Standard_v2")
    sku_tier                       = optional(string, "Standard_v2")
    capacity                       = optional(number, 1)
    gateway_ip_configuration_name  = optional(string, "appgw-gateway-ip-config")
    frontend_port_name             = optional(string, "appgw-frontend-port")
    frontend_port                  = optional(number, 80)
    frontend_ip_configuration_name = optional(string, "appgw-frontend-ip")
    backend_address_pool_name      = optional(string, "appgw-backend-pool")
    backend_http_settings_name     = optional(string, "appgw-http-settings")
    http_listener_name             = optional(string, "appgw-http-listener")
    request_routing_rule_name      = optional(string, "appgw-routing-rule")
  })
  default = null
}

variable "storage_account" {
  description = "Configuration for the storage account."
  type = object({
    name                     = string
    account_tier             = optional(string, "Standard")
    account_replication_type = optional(string, "LRS")
    min_tls_version          = optional(string, "TLS1_2")
  })
  default = null
}

variable "sql_database" {
  description = "Configuration for the SQL database."
  type = object({
    server_name                  = string
    database_name                = string
    administrator_login          = string
    administrator_login_password = string
    sql_version                  = optional(string, "12.0")
    minimum_tls_version          = optional(string, "1.2")
    sku_name                     = optional(string, "Basic")
  })
  default = null
}

variable "vmss" {
  description = "Configuration for the VMSS."
  type = object({
    name                         = string
    subnet_id                    = optional(string)
    subnet_key                   = optional(string)
    sku                          = optional(string, "Standard_B1s")
    instances                    = optional(number, 1)
    admin_username               = string
    admin_password               = string
    image_publisher              = optional(string, "Canonical")
    image_offer                  = optional(string, "0001-com-ubuntu-server-jammy")
    image_sku                    = optional(string, "22_04-lts-gen2")
    image_version                = optional(string, "latest")
    os_disk_storage_account_type = optional(string, "Standard_LRS")
  })
  default = null
}



variable "managed_identity" {
  description = "Configuration for the user assigned managed identity."
  type = object({
    name = string
  })
  default = null
}

variable "log_analytics" {
  description = "Configuration for the Log Analytics workspace."
  type = object({
    name               = string
    sku                = optional(string, "PerGB2018")
    retention_in_days  = optional(number, 30)
  })
  default = null
}

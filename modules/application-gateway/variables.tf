variable "name" {
  description = "Name of the Application Gateway."
  type        = string
}

variable "location" {
  description = "Azure region for the Application Gateway."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where the Application Gateway will be created."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the gateway IP configuration."
  type        = string
}

variable "public_ip_address_id" {
  description = "Public IP ID for the frontend IP configuration."
  type        = string
}

variable "sku_name" {
  description = "SKU name of the Application Gateway."
  type        = string
  default     = "Standard_v2"
}

variable "sku_tier" {
  description = "SKU tier of the Application Gateway."
  type        = string
  default     = "Standard_v2"
}

variable "capacity" {
  description = "Capacity of the Application Gateway."
  type        = number
  default     = 1
}

variable "gateway_ip_configuration_name" {
  description = "Name of the gateway IP configuration."
  type        = string
  default     = "appgw-gateway-ip-config"
}

variable "frontend_port_name" {
  description = "Name of the frontend port."
  type        = string
  default     = "appgw-frontend-port"
}

variable "frontend_port" {
  description = "Port number for the frontend port."
  type        = number
  default     = 80
}

variable "frontend_ip_configuration_name" {
  description = "Name of the frontend IP configuration."
  type        = string
  default     = "appgw-frontend-ip"
}

variable "backend_address_pool_name" {
  description = "Name of the backend address pool."
  type        = string
  default     = "appgw-backend-pool"
}

variable "backend_http_settings_name" {
  description = "Name of the backend HTTP settings."
  type        = string
  default     = "appgw-http-settings"
}

variable "http_listener_name" {
  description = "Name of the HTTP listener."
  type        = string
  default     = "appgw-http-listener"
}

variable "request_routing_rule_name" {
  description = "Name of the request routing rule."
  type        = string
  default     = "appgw-routing-rule"
}

variable "tags" {
  description = "Tags to apply to the Application Gateway."
  type        = map(string)
  default     = {}
}

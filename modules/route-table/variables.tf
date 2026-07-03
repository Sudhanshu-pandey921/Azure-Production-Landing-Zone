variable "resource_group_name" {
  description = "Resource group name where the route tables will be created."
  type        = string
}

variable "location" {
  description = "Azure region for the route tables."
  type        = string
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

variable "tags" {
  description = "Tags to apply to the route tables."
  type        = map(string)
  default     = {}
}

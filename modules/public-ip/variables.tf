variable "resource_group_name" {
  description = "Resource group name where the public IPs will be created."
  type        = string
}

variable "location" {
  description = "Azure region for the public IPs."
  type        = string
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

variable "tags" {
  description = "Tags to apply to the public IPs."
  type        = map(string)
  default     = {}
}

variable "resource_group_name" {
  description = "Resource group where the subnets will be created."
  type        = string
}

variable "virtual_network_name" {
  description = "Virtual network name where the subnets will be attached."
  type        = string
}

variable "subnets" {
  description = "Map of subnets to create."
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
  default = {}
}

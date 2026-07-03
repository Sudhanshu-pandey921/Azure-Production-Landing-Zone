variable "resource_group_name" {
  description = "Resource group where NSGs will be created."
  type        = string
}

variable "location" {
  description = "Azure region for the NSGs."
  type        = string
}

variable "nsgs" {
  description = "Map of NSGs to create."
  type = map(object({
    name = string
  }))
  default = {}
}

variable "tags" {
  description = "Tags to apply to the NSGs."
  type        = map(string)
  default     = {}
}

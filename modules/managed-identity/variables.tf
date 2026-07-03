variable "name" {
  description = "Name of the user assigned managed identity."
  type        = string
}

variable "location" {
  description = "Azure region for the managed identity."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the identity will be created."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the managed identity."
  type        = map(string)
  default     = {}
}

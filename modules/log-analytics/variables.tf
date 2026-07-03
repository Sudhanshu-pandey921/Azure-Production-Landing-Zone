variable "name" {
  description = "Name of the Log Analytics workspace."
  type        = string
}

variable "location" {
  description = "Azure region for the Log Analytics workspace."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the workspace will be created."
  type        = string
}

variable "sku" {
  description = "SKU for the Log Analytics workspace."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Workspace retention in days."
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags to apply to the Log Analytics workspace."
  type        = map(string)
  default     = {}
}

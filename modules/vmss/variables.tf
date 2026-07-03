variable "name" {
  description = "Name of the VMSS."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where the VMSS will be created."
  type        = string
}

variable "location" {
  description = "Azure region for the VMSS."
  type        = string
}

variable "sku" {
  description = "SKU of the VMSS instances."
  type        = string
  default     = "Standard_B1s"
}

variable "instances" {
  description = "Number of VMSS instances."
  type        = number
  default     = 1
}

variable "admin_username" {
  description = "Admin username for the VMSS."
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VMSS."
  type        = string
  sensitive   = true
}

variable "subnet_id" {
  description = "Subnet ID for the VMSS NIC."
  type        = string
}

variable "image_publisher" {
  description = "Image publisher for the VMSS."
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "Image offer for the VMSS."
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "image_sku" {
  description = "Image SKU for the VMSS."
  type        = string
  default     = "22_04-lts-gen2"
}

variable "image_version" {
  description = "Image version for the VMSS."
  type        = string
  default     = "latest"
}

variable "os_disk_storage_account_type" {
  description = "OS disk storage account type."
  type        = string
  default     = "Standard_LRS"
}

variable "tags" {
  description = "Tags to apply to the VMSS."
  type        = map(string)
  default     = {}
}

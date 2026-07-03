locals {
  common_tags = {
    environment = var.environment
    project     = "TerraCore"
    managed_by  = "Terraform"
  }
}

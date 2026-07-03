resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                            = var.name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  sku                             = var.sku
  instances                       = var.instances
  admin_username                  = var.admin_username
  disable_password_authentication = false

  admin_password = var.admin_password

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  os_disk {
    storage_account_type = var.os_disk_storage_account_type
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "nic-${var.name}"
    primary = true

    ip_configuration {
      name      = "ipconfig-${var.name}"
      primary   = true
      subnet_id = var.subnet_id
    }
  }

  tags = var.tags
}

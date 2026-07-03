module "resource_group" {
  source   = "./modules/resource-group"
  rg       = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

module "virtual_network" {
  source              = "./modules/virtual-network"
  vnet                = var.virtual_network_name
  resource_group_name = module.resource_group.name
  location            = var.location
  address_space       = var.virtual_network_address_space
  tags                = local.common_tags

  depends_on = [module.resource_group]
}

module "subnets" {
  source               = "./modules/subnet"
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  subnets              = var.subnets

  depends_on = [module.virtual_network]
}

module "nsgs" {
  source              = "./modules/nsg"
  resource_group_name = module.resource_group.name
  location            = var.location
  nsgs                = var.nsgs
  tags                = local.common_tags

  depends_on = [module.resource_group]
}

module "nsg_associations" {
  source = "./modules/nsg-association"

  associations = {
    for k, v in var.nsg_associations : k => {
      subnet_id = module.subnets.ids[v.subnet_key]
      nsg_id    = module.nsgs.ids[v.nsg_key]
    }
  }

  depends_on = [module.subnets, module.nsgs]
}

module "route_tables" {
  source              = "./modules/route-table"
  resource_group_name = module.resource_group.name
  location            = var.location
  route_tables        = var.route_tables
  tags                = local.common_tags

  depends_on = [module.resource_group]
}

module "public_ips" {
  source              = "./modules/public-ip"
  resource_group_name = module.resource_group.name
  location            = var.location
  public_ips          = var.public_ips
  tags                = local.common_tags

  depends_on = [module.resource_group]
}

module "application_gateway" {
  count = var.application_gateway == null ? 0 : 1

  source                         = "./modules/application-gateway"
  name                           = var.application_gateway.name
  location                       = var.location
  resource_group_name            = module.resource_group.name
  subnet_id                      = try(coalesce(var.application_gateway.subnet_id, try(module.subnets.ids[var.application_gateway.subnet_key], null)), null)
  public_ip_address_id           = try(coalesce(var.application_gateway.public_ip_address_id, try(module.public_ips.ids[var.application_gateway.public_ip_key], null)), null)
  sku_name                       = var.application_gateway.sku_name
  sku_tier                       = var.application_gateway.sku_tier
  capacity                       = var.application_gateway.capacity
  gateway_ip_configuration_name  = var.application_gateway.gateway_ip_configuration_name
  frontend_port_name             = var.application_gateway.frontend_port_name
  frontend_port                  = var.application_gateway.frontend_port
  frontend_ip_configuration_name = var.application_gateway.frontend_ip_configuration_name
  backend_address_pool_name      = var.application_gateway.backend_address_pool_name
  backend_http_settings_name     = var.application_gateway.backend_http_settings_name
  http_listener_name             = var.application_gateway.http_listener_name
  request_routing_rule_name      = var.application_gateway.request_routing_rule_name
  tags                           = local.common_tags

  depends_on = [module.resource_group, module.public_ips, module.subnets, module.nsg_associations]
}

module "storage_account" {
  count = var.storage_account == null ? 0 : 1

  source                   = "./modules/storage-account"
  name                     = var.storage_account.name
  resource_group_name      = module.resource_group.name
  location                 = var.location
  account_tier             = var.storage_account.account_tier
  account_replication_type = var.storage_account.account_replication_type
  min_tls_version          = var.storage_account.min_tls_version
  tags                     = local.common_tags

  depends_on = [module.resource_group]
}

module "sql_database" {
  count = var.sql_database == null ? 0 : 1

  source                       = "./modules/sql-database"
  server_name                  = var.sql_database.server_name
  database_name                = var.sql_database.database_name
  resource_group_name          = module.resource_group.name
  location                     = var.location
  sql_version                  = var.sql_database.sql_version
  administrator_login          = var.sql_database.administrator_login
  administrator_login_password = var.sql_database.administrator_login_password
  minimum_tls_version          = var.sql_database.minimum_tls_version
  sku_name                     = var.sql_database.sku_name
  tags                         = local.common_tags

  depends_on = [module.resource_group]
}

module "vmss" {
  count = var.vmss == null ? 0 : 1

  source                       = "./modules/vmss"
  name                         = var.vmss.name
  resource_group_name          = module.resource_group.name
  location                     = var.location
  sku                          = var.vmss.sku
  instances                    = var.vmss.instances
  admin_username               = var.vmss.admin_username
  admin_password               = var.vmss.admin_password
  subnet_id                    = try(coalesce(var.vmss.subnet_id, try(module.subnets.ids[var.vmss.subnet_key], null)), null)
  image_publisher              = var.vmss.image_publisher
  image_offer                  = var.vmss.image_offer
  image_sku                    = var.vmss.image_sku
  image_version                = var.vmss.image_version
  os_disk_storage_account_type = var.vmss.os_disk_storage_account_type
  tags                         = local.common_tags

  depends_on = [module.resource_group, module.subnets, module.nsg_associations]
}

module "managed_identity" {
  count = var.managed_identity == null ? 0 : 1

  source              = "./modules/managed-identity"
  name                = var.managed_identity.name
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = local.common_tags

  depends_on = [module.resource_group]
}

module "log_analytics" {
  count = var.log_analytics == null ? 0 : 1

  source              = "./modules/log-analytics"
  name                = var.log_analytics.name
  location            = var.location
  resource_group_name = module.resource_group.name
  sku                 = var.log_analytics.sku
  retention_in_days   = var.log_analytics.retention_in_days
  tags                = local.common_tags

  depends_on = [module.resource_group]
}



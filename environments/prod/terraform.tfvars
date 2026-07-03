environment = "prod"
location    = "centralus"

resource_group_name           = "rg-terracore-prod"
virtual_network_name          = "vnet-terracore-prod"
virtual_network_address_space = ["10.30.0.0/16"]

subnets = {
  app = {
    name             = "snet-app"
    address_prefixes = ["10.30.1.0/24"]
  }
  data = {
    name             = "snet-data"
    address_prefixes = ["10.30.2.0/24"]
  }
}

nsgs = {
  app = {
    name = "nsg-app"
  }
}

nsg_associations = {
  app_assoc = {
    subnet_key = "app"
    nsg_key    = "app"
  }
}

route_tables = {
  app_rt = {
    name = "rt-app"
    routes = [
      {
        name           = "default-to-internet"
        address_prefix = "0.0.0.0/0"
        next_hop_type  = "Internet"
      }
    ]
  }
}

public_ips = {
  app_pip = {
    name              = "pip-app"
    allocation_method = "Static"
    sku               = "Standard"
    zones             = []
  }
}

application_gateway = {
  name                           = "agw-app"
  subnet_key                     = "app"
  public_ip_key                  = "app_pip"
  sku_name                       = "Standard_v2"
  sku_tier                       = "Standard_v2"
  capacity                       = 1
  gateway_ip_configuration_name  = "appgw-gateway-ip-config"
  frontend_port_name             = "appgw-frontend-port"
  frontend_port                  = 80
  frontend_ip_configuration_name = "appgw-frontend-ip"
  backend_address_pool_name      = "appgw-backend-pool"
  backend_http_settings_name     = "appgw-http-settings"
  http_listener_name             = "appgw-http-listener"
  request_routing_rule_name      = "appgw-routing-rule"
}

storage_account = {
  name                     = "stterracoreprod001"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

sql_database = {
  server_name                  = "sql-terracore-prod"
  database_name                = "sqldb-terracore-prod"
  administrator_login          = "sqladminuser"
  administrator_login_password = "P@ssw0rd1234!"
  sql_version                  = "12.0"
  minimum_tls_version          = "1.2"
  sku_name                     = "Basic"
}

vmss = {
  name                         = "vmss-terracore-prod"
  subnet_key                   = "app"
  sku                          = "Standard_B1s"
  instances                    = 1
  admin_username               = "azureuser"
  admin_password               = "P@ssw0rd1234!"
  image_publisher              = "Canonical"
  image_offer                  = "0001-com-ubuntu-server-jammy"
  image_sku                    = "22_04-lts-gen2"
  image_version                = "latest"
  os_disk_storage_account_type = "Standard_LRS"
}

resource "azurerm_application_gateway" "resource" {
  for_each = var.resources

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku {
    name     = each.value.sku_name
    tier     = each.value.sku_tier
    capacity = each.value.capacity
  }
  gateway_ip_configuration {
    name      = each.value.gateway_ip_configuration_name
    subnet_id = each.value.subnet_id
  }
  frontend_port {
    name = each.value.frontend_port_name
    port = each.value.frontend_port
  }
  frontend_ip_configuration {
    name                 = each.value.frontend_ip_name
    public_ip_address_id = each.value.public_ip_address_id
  }
  backend_address_pool {
    name = each.value.backend_pool_name
  }
  backend_http_settings {
    name                  = each.value.backend_settings_name
    cookie_based_affinity = "Disabled"
    port                  = each.value.backend_port
    protocol              = "Http"
    request_timeout       = 30
  }
  http_listener {
    name                           = each.value.listener_name
    frontend_ip_configuration_name = each.value.frontend_ip_name
    frontend_port_name             = each.value.frontend_port_name
    protocol                       = "Http"
  }
  request_routing_rule {
    name                       = each.value.routing_rule_name
    priority                   = 100
    rule_type                  = "Basic"
    http_listener_name         = each.value.listener_name
    backend_address_pool_name  = each.value.backend_pool_name
    backend_http_settings_name = each.value.backend_settings_name
  }
  tags = each.value.tags
}

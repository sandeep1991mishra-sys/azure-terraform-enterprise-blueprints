
$ErrorActionPreference = "Stop"
$root = Join-Path $PSScriptRoot "modules\networking"

# Resource-specific starter definitions for the 17 remaining modules.
# Existing completed modules are never modified.

$modules = @{}

$modules["virtual-hub"] = @{
  resource = "azurerm_virtual_hub"
  address = @"
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  virtual_wan_id      = each.value.virtual_wan_id
  address_prefix      = each.value.address_prefix
  sku                 = each.value.sku
  tags                = each.value.tags
"@
  fields = @"
    name                = string
    resource_group_name = string
    location            = string
    virtual_wan_id      = string
    address_prefix      = string
    sku                 = optional(string, "Standard")
    tags                = optional(map(string), {})
"@
}

$modules["vpn-gateway"] = @{
  resource = "azurerm_vpn_gateway"
  address = @"
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  virtual_hub_id      = each.value.virtual_hub_id
  tags                = each.value.tags
"@
  fields = @"
    name                = string
    location            = string
    resource_group_name = string
    virtual_hub_id      = string
    tags                = optional(map(string), {})
"@
}

$modules["local-network-gateway"] = @{
  resource = "azurerm_local_network_gateway"
  address = @"
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  gateway_address     = each.value.gateway_address
  address_space       = each.value.address_space
  tags                = each.value.tags
"@
  fields = @"
    name                = string
    location            = string
    resource_group_name = string
    gateway_address     = string
    address_space       = list(string)
    tags                = optional(map(string), {})
"@
}

$modules["expressroute-circuit"] = @{
  resource = "azurerm_express_route_circuit"
  address = @"
  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  service_provider_name = each.value.service_provider_name
  peering_location      = each.value.peering_location
  bandwidth_in_mbps     = each.value.bandwidth_in_mbps
  sku {
    tier   = each.value.sku_tier
    family = each.value.sku_family
  }
  tags = each.value.tags
"@
  fields = @"
    name                  = string
    resource_group_name   = string
    location              = string
    service_provider_name = string
    peering_location      = string
    bandwidth_in_mbps     = number
    sku_tier              = string
    sku_family            = string
    tags                  = optional(map(string), {})
"@
}

$modules["expressroute-gateway"] = @{
  resource = "azurerm_express_route_gateway"
  address = @"
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  virtual_hub_id      = each.value.virtual_hub_id
  scale_units         = each.value.scale_units
  tags                = each.value.tags
"@
  fields = @"
    name                = string
    resource_group_name = string
    location            = string
    virtual_hub_id      = string
    scale_units         = number
    tags                = optional(map(string), {})
"@
}

$modules["vpn-connection"] = @{
  resource = "azurerm_vpn_connection"
  address = @"
  name                      = each.value.name
  vpn_gateway_id            = each.value.vpn_gateway_id
  remote_vpn_site_id        = each.value.remote_vpn_site_id
  internet_security_enabled = each.value.internet_security_enabled
  tags                      = each.value.tags
"@
  fields = @"
    name                      = string
    vpn_gateway_id            = string
    remote_vpn_site_id        = string
    internet_security_enabled = optional(bool, false)
    tags                      = optional(map(string), {})
"@
}

$modules["bastion"] = @{
  resource = "azurerm_bastion_host"
  address = @"
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku
  ip_configuration {
    name                 = each.value.ip_configuration_name
    subnet_id            = each.value.subnet_id
    public_ip_address_id = each.value.public_ip_address_id
  }
  tags = each.value.tags
"@
  fields = @"
    name                 = string
    location             = string
    resource_group_name  = string
    sku                  = optional(string, "Basic")
    ip_configuration_name = optional(string, "configuration")
    subnet_id            = string
    public_ip_address_id = string
    tags                 = optional(map(string), {})
"@
}

$modules["private-endpoint"] = @{
  resource = "azurerm_private_endpoint"
  address = @"
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  subnet_id           = each.value.subnet_id
  private_service_connection {
    name                           = each.value.connection_name
    private_connection_resource_id = each.value.private_connection_resource_id
    is_manual_connection           = each.value.is_manual_connection
    subresource_names              = each.value.subresource_names
  }
  tags = each.value.tags
"@
  fields = @"
    name                              = string
    location                          = string
    resource_group_name               = string
    subnet_id                         = string
    connection_name                   = string
    private_connection_resource_id    = string
    is_manual_connection              = optional(bool, false)
    subresource_names                 = list(string)
    tags                              = optional(map(string), {})
"@
}

$modules["private-link-service"] = @{
  resource = "azurerm_private_link_service"
  address = @"
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  load_balancer_frontend_ip_configuration_ids = each.value.load_balancer_frontend_ip_configuration_ids
  nat_ip_configuration {
    name      = each.value.nat_ip_name
    primary   = true
    subnet_id = each.value.nat_subnet_id
  }
  tags = each.value.tags
"@
  fields = @"
    name = string
    location = string
    resource_group_name = string
    load_balancer_frontend_ip_configuration_ids = list(string)
    nat_ip_name = string
    nat_subnet_id = string
    tags = optional(map(string), {})
"@
}

$modules["load-balancer"] = @{
  resource = "azurerm_lb"
  address = @"
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku
  frontend_ip_configuration {
    name                 = each.value.frontend_name
    subnet_id            = each.value.subnet_id
    public_ip_address_id = each.value.public_ip_address_id
  }
  tags = each.value.tags
"@
  fields = @"
    name = string
    location = string
    resource_group_name = string
    sku = optional(string, "Standard")
    frontend_name = string
    subnet_id = optional(string)
    public_ip_address_id = optional(string)
    tags = optional(map(string), {})
"@
}

$modules["application-gateway"] = @{
  resource = "azurerm_application_gateway"
  address = @"
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
"@
  fields = @"
    name = string
    location = string
    resource_group_name = string
    sku_name = optional(string, "Standard_v2")
    sku_tier = optional(string, "Standard_v2")
    capacity = optional(number, 2)
    gateway_ip_configuration_name = string
    subnet_id = string
    frontend_port_name = string
    frontend_port = optional(number, 80)
    frontend_ip_name = string
    public_ip_address_id = string
    backend_pool_name = string
    backend_settings_name = string
    backend_port = optional(number, 80)
    listener_name = string
    routing_rule_name = string
    tags = optional(map(string), {})
"@
}

$modules["traffic-manager"] = @{
  resource = "azurerm_traffic_manager_profile"
  address = @"
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  traffic_routing_method = each.value.traffic_routing_method
  dns_config {
    relative_name = each.value.relative_name
    ttl           = each.value.ttl
  }
  monitor_config {
    protocol                     = each.value.monitor_protocol
    port                         = each.value.monitor_port
    path                         = each.value.monitor_path
    interval_in_seconds          = 30
    timeout_in_seconds           = 10
    tolerated_number_of_failures = 3
  }
  tags = each.value.tags
"@
  fields = @"
    name = string
    resource_group_name = string
    traffic_routing_method = string
    relative_name = string
    ttl = optional(number, 100)
    monitor_protocol = optional(string, "HTTPS")
    monitor_port = optional(number, 443)
    monitor_path = optional(string, "/")
    tags = optional(map(string), {})
"@
}

$modules["azure-firewall"] = @{
  resource = "azurerm_firewall"
  address = @"
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  sku_tier            = each.value.sku_tier
  firewall_policy_id  = each.value.firewall_policy_id
  ip_configuration {
    name                 = each.value.ip_configuration_name
    subnet_id            = each.value.subnet_id
    public_ip_address_id = each.value.public_ip_address_id
  }
  tags = each.value.tags
"@
  fields = @"
    name = string
    location = string
    resource_group_name = string
    sku_name = optional(string, "AZFW_VNet")
    sku_tier = optional(string, "Standard")
    firewall_policy_id = optional(string)
    ip_configuration_name = string
    subnet_id = string
    public_ip_address_id = string
    tags = optional(map(string), {})
"@
}

$modules["firewall-policy"] = @{
  resource = "azurerm_firewall_policy"
  address = @"
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
  tags                = each.value.tags
"@
  fields = @"
    name = string
    resource_group_name = string
    location = string
    sku = optional(string, "Standard")
    tags = optional(map(string), {})
"@
}

$modules["front-door"] = @{
  resource = "azurerm_cdn_frontdoor_profile"
  address = @"
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  tags                = each.value.tags
"@
  fields = @"
    name = string
    resource_group_name = string
    sku_name = optional(string, "Standard_AzureFrontDoor")
    tags = optional(map(string), {})
"@
}

$modules["private-dns-zone"] = @{
  resource = "azurerm_private_dns_zone"
  address = @"
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
"@
  fields = @"
    name = string
    resource_group_name = string
    tags = optional(map(string), {})
"@
}

$modules["private-dns-zone-vnet-link"] = @{
  resource = "azurerm_private_dns_zone_virtual_network_link"
  address = @"
  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  private_dns_zone_name = each.value.private_dns_zone_name
  virtual_network_id    = each.value.virtual_network_id
  registration_enabled  = each.value.registration_enabled
  tags                  = each.value.tags
"@
  fields = @"
    name = string
    resource_group_name = string
    private_dns_zone_name = string
    virtual_network_id = string
    registration_enabled = optional(bool, false)
    tags = optional(map(string), {})
"@
}

foreach ($name in $modules.Keys) {
    $folder = Join-Path $root $name

    if (-not (Test-Path $folder)) {
        Write-Warning "Folder missing; skipped: $name"
        continue
    }

    $definition = $modules[$name]
    $resource = $definition.resource
    $fields = $definition.fields
    $address = $definition.address

    $main = @"
resource "$resource" "resource" {
  for_each = var.resources

$address
}
"@

    $variables = @"
variable "resources" {
  description = "Configurations for the $name module."
  type = map(object({
$fields
  }))
  default = {}
}
"@

    $outputs = @"
output "ids" {
  description = "Resource IDs."
  value = { for key, resource in $resource.resource : key => resource.id }
}
output "names" {
  description = "Resource names."
  value = { for key, resource in $resource.resource : key => resource.name }
}
"@

    $readme = @"
# $name

Reusable Terraform module for Azure networking.

## Inputs

- `resources`: Map of resource configurations.

## Outputs

- `ids`: Map of resource IDs.
- `names`: Map of resource names.

## Notes

This is a first-pass module implementation. Review AzureRM provider requirements,
network dependencies, and security settings before deploying.
"@

    Set-Content -Path (Join-Path $folder "main.tf") -Value $main -Encoding utf8
    Set-Content -Path (Join-Path $folder "variables.tf") -Value $variables -Encoding utf8
    Set-Content -Path (Join-Path $folder "outputs.tf") -Value $outputs -Encoding utf8
    Set-Content -Path (Join-Path $folder "README.md") -Value $readme -Encoding utf8

    Write-Host "Generated: $name" -ForegroundColor Green
}

Write-Host "`nGenerated code for the original 17 module folders." -ForegroundColor Cyan
Write-Host "No Azure resources were deployed." -ForegroundColor Yellow

